import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/screens/homePage/homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.book,
          size: 25,
        ), //todo change logo image
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
