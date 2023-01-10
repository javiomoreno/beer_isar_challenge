import 'package:beer_isar_challenge/blocs/blocs.dart';
import 'package:beer_isar_challenge/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BillsBloc>(create: (_) => BillsBloc()),
        BlocProvider<BeersBloc>(create: (_) => BeersBloc()),
        BlocProvider<ClientBillBloc>(create: (_) => ClientBillBloc()),
      ],
      child: MaterialApp(
        title: 'Beer Isar Challenge',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          NewBillScreen.routeName: (_) => const NewBillScreen(),
          NewBeerScreen.routeName: (_) => const NewBeerScreen(),
        },
      ),
    );
  }
}
