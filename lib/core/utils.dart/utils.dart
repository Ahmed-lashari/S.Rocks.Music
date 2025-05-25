import 'package:flutter/material.dart';

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
}
