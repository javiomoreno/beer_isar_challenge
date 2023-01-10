import 'package:beer_isar_challenge/blocs/blocs.dart';
import 'package:beer_isar_challenge/entities/beer.dart';
import 'package:beer_isar_challenge/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBeerScreen extends StatefulWidget {
  static String routeName = 'new_beer';

  const NewBeerScreen({super.key});

  @override
  State<NewBeerScreen> createState() => _NewBeerScreenState();
}

class _NewBeerScreenState extends State<NewBeerScreen> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();

  final TextEditingController _priceTextEditingController =
      TextEditingController();

  void _save() {
    final beer = Beer()
      ..name = _nameTextEditingController.text
      ..price = double.parse(_priceTextEditingController.text);
      
    context.read<BeersBloc>().add(SaveBeer(beer: beer));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Beer'),
      ),
      body: BlocBuilder<BeersBloc, BeersState>(
        builder: (context, state) {
          if (state.add) {
            Future.delayed(Duration.zero, () {
              context.read<BeersBloc>().add(InitBeers());
              Navigator.pop(context);
            });
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: _nameTextEditingController,
                  label: 'Name',
                ),
                const SizedBox(height: 10.0),
                TextFieldWidget(
                  controller: _priceTextEditingController,
                  label: 'Price',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20.0),
                state.loading
                    ? const Center(child: CircularProgressIndicator())
                    : ButtomWidget(
                        onPress: () {
                          bool band = false;

                          if (_nameTextEditingController.text.trim().isEmpty ||
                              _priceTextEditingController.text.trim().isEmpty) {
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
        return Text('Hola');
      },
    );
  }
}
