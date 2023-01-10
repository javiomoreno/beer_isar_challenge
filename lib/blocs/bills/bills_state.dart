part of 'bills_bloc.dart';

class BillsState extends Equatable {
  final bool loading;
  final String error;
  final List<Bill> listBills;
  final bool add;

  const BillsState({
    this.loading = false,
    this.error = '',
    this.listBills = const [],
    this.add = false,
  });

  BillsState copyWith({
    bool? loading,
    String? error,
    List<Bill>? listBills,
    bool? add,
  }) =>
      BillsState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        listBills: listBills ?? this.listBills,
        add: add ?? this.add,
      );

  @override
  List<Object> get props => [loading, error, listBills, add];
}
