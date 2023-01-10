import 'package:beer_isar_challenge/entities/beer_bill.dart';
import 'package:beer_isar_challenge/entities/client.dart';
import 'package:isar/isar.dart';

part 'client_beer_bill.g.dart';

@Collection()
class ClientBeerBill{
  Id id = Isar.autoIncrement;
  late int cant;

  final client = IsarLink<Client>();
  final beerBill = IsarLink<BeerBill>();
}