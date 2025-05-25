import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
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
    debugPrint("\n\nSTACK-TRACE = ${h.toString()}\n\n");
  }

  static void toastMsg(String title, ToastificationType type) {
    toastification.show(
      autoCloseDuration: const Duration(seconds: 5),
      type: type,
      title: Text(title),
    );
  }

// Helper method to calculate the width of static text
  static double getStaticTextWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.whiteColor.withValues(alpha: 0.6),
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width + 3.w;
  }
}
