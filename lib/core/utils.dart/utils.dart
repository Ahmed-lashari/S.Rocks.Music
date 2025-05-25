import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Utils {
  static MediaQueryData getMediaQuery(BuildContext context) {
    return MediaQuery.of(context);
  }

  static double getHeight(BuildContext context) {
    return getMediaQuery(context).size.height;
  }

  static double getWeidth(BuildContext context) {
    return getMediaQuery(context).size.width;
  }

  static void handleError(dynamic e, StackTrace h) {
    debugPrint("ERROR = : ${e.toString()}\n\n");
    debugPrint("\n\nSTACK-TRACE = {h.toString()}\n\n");
  }

  static void toastMsg(String title, ToastificationType type) {
    toastification.show(
      autoCloseDuration: const Duration(seconds: 5),
      type: type,
      title: Text(title),
    );
  }
}
