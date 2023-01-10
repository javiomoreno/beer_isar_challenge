import 'package:beer_isar_challenge/blocs/blocs.dart';
import 'package:beer_isar_challenge/entities/bill.dart';
import 'package:beer_isar_challenge/presentation/screens/bill/detail/Detail.dart';
import 'package:beer_isar_challenge/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BillsBloc>().add(GetAllBill());
    
    return Scaffold(
      appBar: AppBar(title: const Text('Beer Isar Challenge')),
      body: BlocBuilder<BillsBloc, BillsState>(
        builder: (context, state) {
          return state.listBills.isNotEmpty
              ? ListView.builder(
                  itemCount: state.listBills.length,
                  itemBuilder: (context, index) {
                    final item = state.listBills[index];
                    return _item(context, item);
                  },
                )
              : const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, NewBillScreen.routeName),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _item(BuildContext context, Bill item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => DetailScreen(bill: item),
          ),
        );
      },
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(DateFormat('dd/MM/yyyy')
            .addPattern('-')
            .add_Hm()
            .format(DateTime.parse(item.date))),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
