part of 'beers_bloc.dart';

abstract class BeersEvent extends Equatable {
  const BeersEvent();

  @override
  List<Object> get props => [];
}

class InitBeers extends BeersEvent {}

class GetAllBeer extends BeersEvent {}

class SaveBeer extends BeersEvent {
  final Beer beer;

  const SaveBeer({required this.beer});
}

class GetBeersByBill extends BeersEvent {
  final Bill bill;

  const GetBeersByBill({required this.bill});
}
