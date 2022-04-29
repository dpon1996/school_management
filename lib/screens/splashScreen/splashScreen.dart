import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/res/images.dart';
import 'package:interview/screens/homePage/homePage.dart';
import 'package:interview/supportingWidgets/Qtext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              logoImge,
              width: 200,
            ),
            const SizedBox(height: 20),
            const QText(
              "Classroom manager",
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _openHomePage();
    super.initState();
  }

  _openHomePage() {
    Timer(
      const Duration(seconds: 2),
      () {
        pushAndReplace(context, const HomePage());
      },
    );
  }
}
