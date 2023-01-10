import 'package:beer_isar_challenge/entities/beer.dart';
import 'package:beer_isar_challenge/entities/beer_bill.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:beer_isar_challenge/entities/client.dart';
import 'package:beer_isar_challenge/entities/client_beer_bill.dart';
import 'package:isar/isar.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDb();
  }

  Future<int> saveBill(Bill newBill) async {
    final isar = await db;
    return isar.writeTxnSync<int>(() => isar.bills.putSync(newBill));
  }

  Future<List<Bill>> listBills() async {
    final isar = await db;
    return await isar.bills.where().findAll();
  }

  Future<Bill?> getBill(String name) async {
    final isar = await db;
    return isar.bills.filter().nameEqualTo(name).findFirst();
  }

  Future<void> saveBeer(Beer newBeer) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.beers.putSync(newBeer));
  }

  Future<List<Beer>> listBeers() async {
    final isar = await db;
    return await isar.beers.where().findAll();
  }

  Future<void> saveBeerBill(BeerBill newBeerBill) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.beerBills.putSync(newBeerBill));
  }

  Future<List<BeerBill>> getBeerByBill(Bill bill) async {
    final isar = await db;
    return isar.beerBills
        .filter()
        .bill((b) => b.nameEqualTo(bill.name))
        .findAll();
  }

  Future<void> saveClientBeerBill(ClientBeerBill newClientBeerBill) async {
    final isar = await db;
    isar.writeTxnSync<int>(
        () => isar.clientBeerBills.putSync(newClientBeerBill));
  }

  Future<ClientBeerBill?> existClientBeerBill(
      Client newClient, BeerBill newBeerBill) async {
    final isar = await db;
    return await isar.clientBeerBills
        .filter()
        .client((cli) => cli.nameEqualTo(newClient.name))
        .beerBill((bb) => bb.idEqualTo(newBeerBill.id))
        .findFirst();
  }

  Future<void> saveClient(Client newClient) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.clients.putSync(newClient));
  }

  Future<Client?> existClient(Client newClient) async {
    final isar = await db;
    return await isar.clients.filter().nameEqualTo(newClient.name).findFirst();
  }

  Future<List<ClientBeerBill>> getClientBeerByBill(Bill bill) async {
    final isar = await db;
    return isar.clientBeerBills
        .filter()
        .beerBill((bb) => bb.bill((bi) => bi.nameEqualTo(bill.name)))
        .findAll();
  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          BillSchema,
          BeerSchema,
          BeerBillSchema,
          ClientSchema,
          ClientBeerBillSchema
        ],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
