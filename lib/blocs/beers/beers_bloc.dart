import 'package:beer_isar_challenge/entities/beer_bill.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:beer_isar_challenge/services/isar.dart';
import 'package:bloc/bloc.dart';
import 'package:beer_isar_challenge/entities/beer.dart';
import 'package:equatable/equatable.dart';

part 'beers_event.dart';
part 'beers_state.dart';

class BeersBloc extends Bloc<BeersEvent, BeersState> {
  static IsarService? isarService = IsarService();

  BeersBloc() : super(const BeersState()) {
    on<InitBeers>(
        (event, emit) => emit(state.copyWith(add: false, loading: false)));

    on<GetAllBeer>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final list = await isarService?.listBeers();
        emit(state.copyWith(loading: false, listBeers: list));
      } catch (error) {
        emit(state.copyWith(loading: false, error: error.toString()));
      }
    });

    on<SaveBeer>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        await isarService?.saveBeer(event.beer);
        emit(state.copyWith(loading: false, add: true));

        add(GetAllBeer());
      } catch (error) {
        emit(state.copyWith(loading: false, error: error.toString()));
      }
    });

    on<GetBeersByBill>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await isarService?.getBeerByBill(event.bill);
        emit(state.copyWith(loading: false, listBeerBill: resp));

        add(GetAllBeer());
      } catch (error) {
        emit(state.copyWith(loading: false, error: error.toString()));
      }
    });
  }
}
