import 'package:beer_isar_challenge/entities/client_beer_bill.dart';
import 'package:isar/isar.dart';

part 'client.g.dart';

@Collection()
class Client {
  Id id = Isar.autoIncrement;
  late String name;
}
