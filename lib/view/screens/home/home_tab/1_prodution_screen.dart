import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/view/themes/theme_constants.dart';

class ProductionScreen extends StatelessWidget {
  const ProductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("Music Production"),
        ),
        body: Center(
            child: Text("You tapped on: Music Production",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: AppTypoGraphy.lobster, fontSize: 20.sp))));
  }
}
