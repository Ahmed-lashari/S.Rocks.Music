import 'dart:developer';
import 'package:flutter/material.dart';

class AppNavigator {
  static Future navigateTo(BuildContext context,
      {String? sRoute, Widget? wRoute}) async {
    try {
      if (sRoute != null) {
        await Navigator.pushNamed(context, sRoute);
      } else {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => wRoute!));
      }
    } catch (e) {
      log('error in changing the screen');
    }
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
