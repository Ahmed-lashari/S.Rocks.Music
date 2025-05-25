import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/view/themes/theme_constants.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("Default Screen"),
        ),
        body: Center(
            child: Text(
                "Tapped Screen not found. Your are redirected to: Default Screen",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: AppTypoGraphy.lobster, fontSize: 20.sp))));
  }
}
