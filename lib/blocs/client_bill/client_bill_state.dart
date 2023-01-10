part of 'client_bill_bloc.dart';

class ClientBillState extends Equatable {
  final bool loading;
  final String error;
  final Bill? bill;
  final bool add;
  final bool updated;
  final List<ClientBeerBill> listClientBeerBill;

  const ClientBillState({
    this.loading = false,
    this.error = '',
    this.bill,
    this.add = false,
    this.updated = false,
    this.listClientBeerBill = const [],
  });

  ClientBillState copyWith({
    bool? loading,
    String? error,
    Bill? bill,
    bool? add,
    bool? updated,
    List<ClientBeerBill>? listClientBeerBill,
  }) =>
      ClientBillState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        bill: bill ?? this.bill,
        add: add ?? this.add,
        updated: updated ?? this.updated,
        listClientBeerBill: listClientBeerBill ?? this.listClientBeerBill,
      );

  @override
  List<dynamic> get props =>
      [loading, error, bill, add, updated, listClientBeerBill];
}
