part of 'bills_bloc.dart';

abstract class BillsEvent extends Equatable {
  const BillsEvent();

  @override
  List<Object> get props => [];
}

class InitBills extends BillsEvent {}

class GetAllBill extends BillsEvent {}

class SaveBill extends BillsEvent {
  final Bill bill;
  final List<Beer> listBeers;

  const SaveBill({required this.bill, required this.listBeers});
}
