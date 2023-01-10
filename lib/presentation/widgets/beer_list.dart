import 'package:beer_isar_challenge/blocs/blocs.dart';
import 'package:beer_isar_challenge/entities/beer_bill.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBeersWidget extends StatefulWidget {
  final Function onSelect;
  final Bill bill;

  const ListBeersWidget({
    Key? key,
    required this.onSelect,
    required this.bill,
  }) : super(key: key);

  @override
  State<ListBeersWidget> createState() => _ListBeersWidgetState();
}

class _ListBeersWidgetState extends State<ListBeersWidget> {
  @override
  void initState() {
    context.read<BeersBloc>().add(GetBeersByBill(bill: widget.bill));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: BlocBuilder<BeersBloc, BeersState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Select an beer',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children:
                    state.listBeerBill.map((bebi) => _item(bebi)).toList(),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _item(BeerBill beerBill) {
    return Column(
      children: [
        ListTile(
          title: Text(
            beerBill.beer.value!.name,
          ),
          subtitle: Text('${beerBill.beer.value!.price}'),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            widget.onSelect(beerBill);
            Navigator.pop(context);
          },
        ),
        const Divider()
      ],
    );
  }
}
