
import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/supportingWidgets/Qtext.dart';

showSnackBar(String title, {Color color = Colors.black,int duration = 2}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: QText(title),
      backgroundColor: color,
      duration: Duration(seconds: duration),
      elevation: 0,
    ),
  );
}
