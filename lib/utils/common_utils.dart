import 'package:flutter/material.dart';

class GlobalVariable {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();

  static showMsg({String msg = ""}) {
    SnackBar snackBar = SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(
      GlobalVariable.navState.currentState!.context,
    ).showSnackBar(snackBar);
  }
}
