import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/utils.dart/validators/validators_service.dart';
import 'package:skility_x/view_model/data_providers/screens/widgets/text_controller_provider.dart';
import 'package:skility_x/view/widgets/custom_icons.dart';

class myTextField extends ConsumerWidget {
  final String hintText;
  final String prefixIcon;
  final String suffixIcon;
  final String controllerKey;
  final String? nextFocusKey;
  final TextInputType keyboardType;
  final bool obscureText;
  final EdgeInsets? contentPadding;
  final String? Function(String?)? validator;
  final int maxLines;
  final int? maxLength;

  const myTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    this.contentPadding,
    required this.controllerKey,
    this.nextFocusKey,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(textControllerProvider(controllerKey));
    final currFocus = ref.watch(focusNodeProvider(controllerKey));

    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      cursorColor: AppColors.whiteColor,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: "*",
      style: TextStyle(fontSize: 16.sp, color: AppColors.whiteColor),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomIcon(
              icon: prefixIcon, size: 30, color: AppColors.whiteColor),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 1.w,
              height: 20.h,
              color: AppColors.whiteColor.withAlpha(50),
              margin: EdgeInsets.symmetric(horizontal: 8.w),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0.w),
              child: CustomIcon(
                  icon: suffixIcon, size: 30, color: AppColors.whiteColor),
            ),
          ],
        ),
        hintText: hintText,
      ),
      focusNode: currFocus,
      canRequestFocus: true,
      textInputAction:
          nextFocusKey == null ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: (_) {
        if (nextFocusKey != null) {
          final nextFocus = ref.read(focusNodeProvider(nextFocusKey!));
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          currFocus.unfocus();
        }
      },
      validator: validator ?? (v) => Validators.requiredField(v),
    );
  }
}
