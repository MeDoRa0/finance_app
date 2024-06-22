import 'dart:async';

import 'package:finance_app/app_images.dart';
import 'package:finance_app/pages/home.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //this timer will make splash screen appear for 3 seconds
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.svgLogo),
            SizedBox(
              height: 20,
            ),
            Text(
              'Finance',
              style: TextStyle(
                  fontSize: 24,
                  color: kPrimaryGreen,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
