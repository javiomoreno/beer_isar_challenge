import 'package:beer_isar_challenge/entities/beer.dart';
import 'package:isar/isar.dart';

part 'bill.g.dart';

@Collection()
class Bill{
  Id id = Isar.autoIncrement;
  late String name;
  late String date;
  late double total;

  // @Backlink(to: 'bill')
  // final beerBill = IsarLinks<BeerBill>();
}