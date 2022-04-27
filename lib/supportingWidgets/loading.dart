
import 'package:flutter/material.dart';
import 'package:interview/res/colors.dart';
import 'package:interview/supportingWidgets/Qtext.dart';

class Loading {
  basic() {
    return const LinearProgressIndicator();
  }

  circularProgress(
      {Color color = primaryColor,
      double strokeWidth = 3.0,
      double height = 20,
      double? value}) {
    return SizedBox(
      height: height,
      width: height,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          strokeWidth: strokeWidth,
          value: value,
        ),
      ),
    );
  }

  fullScreenLoading({
    EdgeInsets padding = const EdgeInsets.only(top: 0),
    Color bgColor = Colors.white,
    String title = "Loading..",
    String details =
        "Lorem ipsum dolor sit amet\nadipiscing elit. Porta venenatis fauc",//todo
  }) {
    return Container(
      margin: padding,
      color: bgColor,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}
