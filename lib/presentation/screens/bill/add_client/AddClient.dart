import 'package:beer_isar_challenge/blocs/blocs.dart';
import 'package:beer_isar_challenge/entities/beer_bill.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:beer_isar_challenge/entities/client.dart';
import 'package:beer_isar_challenge/presentation/widgets/widgets.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClient extends StatefulWidget {
  final Bill bill;

  const AddClient({super.key, required this.bill});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  Contact? contact;
  BeerBill? _selectBeerBill;

  @override
  void initState() {
    context.read<BeersBloc>().add(GetBeersByBill(bill: widget.bill));
    super.initState();
  }

  void _save() {
    final client = Client()..name = contact!.displayName!;

    context
        .read<ClientBillBloc>()
        .add(SaveContactBill(client: client, beerBill: _selectBeerBill!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add client to bill')),
      body: BlocBuilder<ClientBillBloc, ClientBillState>(
        builder: (context, state) {
          if (state.add) {
            Future.delayed(Duration.zero, () {
              context.read<ClientBillBloc>().add(GetClientBeerBill(bill: widget.bill));
              Navigator.pop(context);
            });
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _contact(context),
                const SizedBox(height: 20.0),
                _beer(context),
                const SizedBox(height: 20.0),
                state.loading
                    ? const Center(child: CircularProgressIndicator())
                    : ButtomWidget(
                        onPress: () {
                          bool band = false;

                          if (contact == null || _selectBeerBill == null) {
                            band = true;
                          }

                          if (band) return;

                          _save();
                        },
                        text: 'Save',
                      )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _contact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contact'),
        const SizedBox(height: 10.0),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return ListContactsWidget(
                  onSelect: (conta) {
                    setState(() {
                      contact = conta;
                    });
                  },
                );
              },
            );
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    contact != null ? contact!.displayName! : 'Select contact'),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _beer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Beer'),
        const SizedBox(height: 10.0),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return ListBeersWidget(
                  bill: widget.bill,
                  onSelect: (bebi) {
                    setState(() {
                      _selectBeerBill = bebi;
                    });
                  },
                );
              },
            );
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectBeerBill != null
                    ? _selectBeerBill!.beer.value!.name
                    : 'Select an beer'),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
