import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:skility_x/view/screens/home/home_tab/1_prodution_screen.dart';
import 'package:skility_x/view/screens/home/home_tab/2_mixing_screen.dart';
import 'package:skility_x/view/screens/home/home_tab/3_lyrics_screen.dart';
import 'package:skility_x/view/screens/home/home_tab/4_vocals_screen.dart';
import 'package:skility_x/view/screens/home/home_tab/default_fallback.dart';

// we can also create a route enum for better debugging in large projects but for now, its only one screen so that worldnt be an issue

Widget getWidgetFromRoute(String routeName) {
  switch (routeName) {
    case 'production':
      return const ProductionScreen();
    case 'Mixing':
      return const MixingScreen();
    case 'Lyrics':
      return const LyricsScreen();
    case 'Vocals':
      return const VocalsScreen();

// fallback
    default:
      return const DefaultScreen();
  }
}

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
