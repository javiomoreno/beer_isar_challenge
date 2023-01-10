import 'package:beer_isar_challenge/blocs/blocs.dart';
import 'package:beer_isar_challenge/entities/beer.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:beer_isar_challenge/presentation/screens/beer/Beer.dart';
import 'package:beer_isar_challenge/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class NewBillScreen extends StatefulWidget {
  static String routeName = 'new_bill';

  const NewBillScreen({super.key});

  @override
  State<NewBillScreen> createState() => _NewBillScreenState();
}

class _NewBillScreenState extends State<NewBillScreen> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  late List<Beer> _selectBeer = [];

  @override
  void initState() {
    context.read<BeersBloc>().add(GetAllBeer());
    super.initState();
  }

  void _save() {
    final bill = Bill()
      ..date = DateTime.now().toString()
      ..name = _nameTextEditingController.text
      ..total = 0.0;

    context.read<BillsBloc>().add(SaveBill(bill: bill, listBeers: _selectBeer));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Bill'),
      ),
      body: BlocBuilder<BillsBloc, BillsState>(
        builder: (context, state) {
          if(state.add){
            Future.delayed(Duration.zero,(){
              context.read<BillsBloc>().add(InitBills());
              Navigator.pop(context);
            });
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  controller: _nameTextEditingController,
                  label: 'Name',
                ),
                const SizedBox(height: 10.0),
                _beers(),
                const SizedBox(height: 5.0),
                LinkIconWidget(
                  onPress: () =>
                      Navigator.pushNamed(context, NewBeerScreen.routeName),
                  icon: Icons.add,
                  text: 'Add new beer',
                ),
                const SizedBox(height: 20.0),
                state.loading
                    ? const Center(child: CircularProgressIndicator())
                    : ButtomWidget(
                        onPress: () {
                          bool band = false;

                          if (_nameTextEditingController.text.trim().isEmpty ||
                              _selectBeer.isEmpty) {
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

  Widget _beers() {
    return BlocBuilder<BeersBloc, BeersState>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Beers'),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: MultiSelectDialogField(
              items: state.listBeers
                  .map((e) => MultiSelectItem(e, e.name))
                  .toList(),
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                _selectBeer = values;
              },
            ),
          ),
        ]);
      },
    );
  }
}
