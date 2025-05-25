import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:skility_x/view/screens/home/home_tab/1_prodution_screen.dart';
import 'package:skility_x/view/screens/home/home_tab/2_mixing_screen.dart';
import 'package:skility_x/view/screens/home/home_tab/3_lyrics_screen.dart';
import 'package:skility_x/view/screens/home/home_tab/4_vocals_screen.dart';
import 'package:skility_x/view/screens/home/home_tab/default_fallback.dart';

// we can also utilize enum as well for better debugging but for one screen thats not rellly needed

Widget getRouteWidget(String routeName) {
  final normalized = routeName.toLowerCase().replaceAll("/", "").trim();

  switch (normalized) {
    case 'production':
      return const ProductionScreen();
    case 'mixing':
      return const MixingScreen();
    case 'lyrics':
      return const LyricsScreen();
    case 'vocals':
      return const VocalsScreen();
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
