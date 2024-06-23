import 'package:finance_app/pages/home.dart';
import 'package:finance_app/pages/on_boarding.dart';
import 'package:finance_app/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Finance_app());
}

class Finance_app extends StatelessWidget {
  const Finance_app({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
