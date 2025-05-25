import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/view/themes/theme_constants.dart';

class VocalsScreen extends StatelessWidget {
  const VocalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("Vocals"),
        ),
        body: Center(
            child: Text("You tapped on: Vocals",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: AppTypoGraphy.lobster, fontSize: 20.sp))));
  }
}
