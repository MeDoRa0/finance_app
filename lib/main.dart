import 'package:finance_app/managment/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/models/finance_model.dart';
import 'package:finance_app/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  //this code enable us to use hive in the project
  await Hive.initFlutter();
  // Register Adapter
  Hive.registerAdapter(FinanceModelAdapter());

  await Hive.openBox<FinanceModel>('financeBox');

  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    //provide the cubit to our project
    return BlocProvider(
      create: (context) => FetchDataCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
