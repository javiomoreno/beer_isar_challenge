import 'package:beer_isar_challenge/blocs/blocs.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:beer_isar_challenge/entities/client_beer_bill.dart';
import 'package:beer_isar_challenge/presentation/screens/bill/add_client/AddClient.dart';
import 'package:beer_isar_challenge/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final Bill bill;
  const DetailScreen({super.key, required this.bill});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late double _total = 0.0;

  @override
  void initState() {
    context.read<ClientBillBloc>().add(GetClientBeerBill(bill: widget.bill));
    super.initState();
  }

  void _getTotal(List<ClientBeerBill> list) {
    late double total = 0;
    for (var cbb in list) {
      total += cbb.cant * cbb.beerBill.value!.beer.value!.price;
    }
    _total = total;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.bill.name)),
      body: BlocBuilder<ClientBillBloc, ClientBillState>(
        builder: (context, state) {
          Future.delayed(Duration.zero, () {
            _getTotal(state.listClientBeerBill);
          });
          return Column(
            children:
                state.listClientBeerBill.map((cbb) => _item(cbb)).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.group_add_rounded),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => AddClient(bill: widget.bill),
          ),
        ),
      ),
      bottomNavigationBar: _totalWidget(),
    );
  }

  Widget _item(ClientBeerBill clientBeerBill) {
    return Column(
      children: [
        ListTile(
          title: Text(clientBeerBill.client.value!.name),
          subtitle: Text(
              '${clientBeerBill.beerBill.value!.beer.value!.name}: ${clientBeerBill.cant}'),
          trailing: Text(
              'Total: ${clientBeerBill.cant * clientBeerBill.beerBill.value!.beer.value!.price}'),
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return _dialog(clientBeerBill);
              },
            );
          },
        ),
        const Divider()
      ],
    );
  }

  Widget _totalWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 100.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Total: ',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 20.0),
          Text(
            _total.toString(),
            style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _dialog(ClientBeerBill clientBeerBill) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Add an beer',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                clientBeerBill.beerBill.value!.beer.value!.name,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20.0),
              const Text(
                '+ 1',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Center(
            child: ButtomWidget(
              onPress: () {
                context
                    .read<ClientBillBloc>()
                    .add(AddBeerClientBill(clientBeerBill: clientBeerBill));
                Navigator.pop(context);
              },
              text: 'Save',
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
