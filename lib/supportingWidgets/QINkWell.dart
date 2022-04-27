import 'package:flutter/material.dart';

class QInkWell extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget child;

  const QInkWell({Key? key, required this.onTap, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
