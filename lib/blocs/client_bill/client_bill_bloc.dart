import 'package:beer_isar_challenge/entities/beer_bill.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:beer_isar_challenge/entities/client.dart';
import 'package:beer_isar_challenge/entities/client_beer_bill.dart';
import 'package:beer_isar_challenge/services/isar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_bill_event.dart';
part 'client_bill_state.dart';

class ClientBillBloc extends Bloc<ClientBillEvent, ClientBillState> {
  static IsarService? isarService = IsarService();

  ClientBillBloc() : super(const ClientBillState()) {
    on<InitClientBill>(
        (event, emit) => emit(state.copyWith(add: false, loading: false)));

    on<GetBill>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await isarService?.getBill(event.bill.name);
        emit(state.copyWith(loading: false, bill: resp));
      } catch (error) {
        emit(state.copyWith(loading: false, error: error.toString()));
      }
    });

    on<GetClientBeerBill>((event, emit) async {
      try {
        emit(state.copyWith(loading: true, add: false));
        final resp = await isarService?.getClientBeerByBill(event.bill);
        emit(state.copyWith(loading: false, listClientBeerBill: resp));
      } catch (error) {
        emit(state.copyWith(loading: false, error: error.toString()));
      }
    });

    on<SaveContactBill>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));

        var client = await isarService?.existClient(event.client);

        ///verify exist client
        if (client == null) {
          await isarService?.saveClient(event.client);
          client = event.client;
        }

        var clientBeerBill = await isarService?.existClientBeerBill(
            event.client, event.beerBill);

        ///verify exist clientBeerBill
        if (clientBeerBill == null) {
          clientBeerBill = ClientBeerBill()
            ..cant = 1
            ..beerBill.value = event.beerBill
            ..client.value = client;
        } else {
          clientBeerBill.cant = clientBeerBill.cant + 1;
        }

        await isarService?.saveClientBeerBill(clientBeerBill);
        emit(state.copyWith(loading: false, add: true));
      } catch (error) {
        emit(state.copyWith(loading: false, error: error.toString()));
      }
    });

    on<AddBeerClientBill>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        event.clientBeerBill.cant = event.clientBeerBill.cant + 1;
        await isarService?.saveClientBeerBill(event.clientBeerBill);
        emit(state.copyWith(loading: false, updated: true));
      } catch (error) {
        emit(state.copyWith(loading: false, error: error.toString()));
      }
    });
  }
}
