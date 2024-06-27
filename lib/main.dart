import 'package:finance_app/models/finance_model.dart';
import 'package:finance_app/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  //this code enable us to use hive in the project
  await Hive.initFlutter();
  // Register Adapter
  Hive.registerAdapter(FinanceModelAdapter());

  await Hive.openBox('financeBox');

  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
