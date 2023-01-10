part of 'client_bill_bloc.dart';

abstract class ClientBillEvent extends Equatable {
  const ClientBillEvent();

  @override
  List<Object> get props => [];
}

class InitClientBill extends ClientBillEvent {}

class GetBill extends ClientBillEvent {
  final Bill bill;

  const GetBill({required this.bill});
}

class SaveContactBill extends ClientBillEvent {
  final Client client;
  final BeerBill beerBill;

  const SaveContactBill({required this.client, required this.beerBill});
}

class GetClientBeerBill extends ClientBillEvent {
  final Bill bill;

  const GetClientBeerBill({required this.bill});
}

class AddBeerClientBill extends ClientBillEvent {
  final ClientBeerBill clientBeerBill;

  const AddBeerClientBill({required this.clientBeerBill});
}
