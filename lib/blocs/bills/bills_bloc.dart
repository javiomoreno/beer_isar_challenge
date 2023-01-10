import 'package:beer_isar_challenge/entities/beer.dart';
import 'package:beer_isar_challenge/entities/beer_bill.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:beer_isar_challenge/services/isar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bills_event.dart';
part 'bills_state.dart';

class BillsBloc extends Bloc<BillsEvent, BillsState> {
  static IsarService? isarService = IsarService();

  BillsBloc() : super(const BillsState()) {
    on<InitBills>(
        (event, emit) => emit(state.copyWith(add: false, loading: false)));

    on<GetAllBill>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final list = await isarService?.listBills();
        emit(state.copyWith(loading: false, listBills: list));
      } catch (error) {
        emit(state.copyWith(loading: false, error: error.toString()));
      }
    });

    on<SaveBill>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        await isarService?.saveBill(event.bill);

        ///add beers to bill
        for (var beer in event.listBeers) {
          final beerBill = BeerBill()
            ..beer.value = beer
            ..bill.value = event.bill;
          await isarService?.saveBeerBill(beerBill);
        }
        emit(state.copyWith(loading: false, add: true));

        add(GetAllBill());
      } catch (error) {
        emit(state.copyWith(loading: false, error: error.toString()));
      }
    });
  }
}
