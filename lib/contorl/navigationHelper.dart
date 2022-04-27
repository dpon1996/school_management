import 'package:flutter/material.dart';

///to get current context
GlobalKey<NavigatorState> navigatorKey = GlobalKey();

push(BuildContext context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}

pushAndReplace(BuildContext context,page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}

pushAndRemoveUntil(BuildContext context,page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
    (_) => false,
  );
}
