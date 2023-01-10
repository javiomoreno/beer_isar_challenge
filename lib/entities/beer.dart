import 'package:isar/isar.dart';

part 'beer.g.dart';

@Collection()
class Beer{
  Id id = Isar.autoIncrement;
  late String name;
  late double price;

  // @Backlink(to: 'beer')
  // final beerBill = IsarLink<BeerBill>();
}