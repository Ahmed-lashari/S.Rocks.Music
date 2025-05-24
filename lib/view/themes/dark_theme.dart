import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/view/themes/theme_constants.dart';

class DarkTheme {
  ThemeData get theme => _getdarkThemeData();

  ThemeData _getdarkThemeData() {
    final base = ThemeData.dark(useMaterial3: true);

// your theme goes here
    return base.copyWith(
      textTheme: ThemeConsts.textTheme,
      inputDecorationTheme: _buildInputDecoration(),
    );
  }

  InputDecorationTheme _buildInputDecoration() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFieldBgColor,
      hintStyle:
          TextStyle(color: AppColors.textFieldHintColor, fontSize: 16.sp),
      prefixIconColor: AppColors.whiteColor,
      suffixIconColor: AppColors.whiteColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
      prefixIconConstraints: BoxConstraints(maxWidth: 100.w, maxHeight: 100.h),
      suffixIconConstraints: BoxConstraints(maxWidth: 100.w, maxHeight: 100.h),
    );
  }
}
