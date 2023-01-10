import 'package:beer_isar_challenge/entities/beer.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:isar/isar.dart';

part 'beer_bill.g.dart';

@Collection()
class BeerBill{
  Id id = Isar.autoIncrement;

  final bill = IsarLink<Bill>();
  final beer = IsarLink<Beer>();

  // @Backlink(to: 'beerBill')
  // final clientBeerBill = IsarLink<ClientBeerBill>();
}