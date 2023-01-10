part of 'beers_bloc.dart';

class BeersState extends Equatable {
  final bool loading;
  final String error;
  final List<Beer> listBeers;
  final List<BeerBill> listBeerBill;
  final bool add;

  const BeersState({
    this.loading = false,
    this.error = '',
    this.listBeers = const [],
    this.listBeerBill = const [],
    this.add = false,
  });

  BeersState copyWith({
    bool? loading,
    String? error,
    List<Beer>? listBeers,
    List<BeerBill>? listBeerBill,
    bool? add,
  }) =>
      BeersState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        listBeers: listBeers ?? this.listBeers,
        listBeerBill: listBeerBill ?? this.listBeerBill,
        add: add ?? this.add,
      );

  @override
  List<Object> get props => [loading, error, listBeers, listBeerBill, add];
}
