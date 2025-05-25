// took some help from chatgpt in iplementing the hint cycle animation

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/utils.dart/validators/validators_service.dart';
import 'package:skility_x/view_model/data_providers/screens/widgets/text_controller_provider.dart';
import 'package:skility_x/view/widgets/custom_icons.dart';
import 'package:skility_x/view_model/ui_providers/screens/widgets/text_field_hint_messages.dart';

class myTextField extends ConsumerWidget {
  final List<String> hintMessages;
  final String? hintText;
  final String staticPrefix; // Add this new parameter

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
    this.hintMessages = const [],
    this.hintText,
    this.staticPrefix = "Search ",
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
    debugPrint("building whole text field");
    final controller = ref.watch(textControllerProvider(controllerKey));
    final currFocus = ref.watch(focusNodeProvider(controllerKey));

    // hint list checking
    final shouldUseAnimatedHints = hintMessages.isNotEmpty;

    if (shouldUseAnimatedHints) {
      ref.listen(textControllerProvider(controllerKey), (previous, next) {
        final animatedHintNotifier =
            ref.read(animatedHintProvider(hintMessages).notifier);
        animatedHintNotifier.updateTextFieldState(next.text.isEmpty);
      });
    }

    Widget hintWidget;

    if (shouldUseAnimatedHints) {
      hintWidget = Consumer(builder: (context, ref, _) {
        final animatedHintState = ref.watch(animatedHintProvider(hintMessages));
        final currentHint = hintMessages[animatedHintState.currentIndex];

        return Row(spacing: 5.w, children: [
          // static "search" text part
          Text(staticPrefix,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.whiteColor.withValues(alpha: 0.6))),

          // animated text part
          AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(opacity: animation, child: child));
              },
              child: Text(currentHint,
                  key: ValueKey(currentHint),
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.whiteColor.withValues(alpha: 0.6))))
        ]);
      });
    } else {
      hintWidget = const SizedBox.shrink();
    }

    return Stack(children: [
      TextFormField(
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
                      icon: prefixIcon, size: 25, color: AppColors.whiteColor)),
              suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                    width: 1.w,
                    height: 20.h,
                    color: AppColors.whiteColor.withAlpha(50),
                    margin: EdgeInsets.symmetric(horizontal: 8.w)),
                Padding(
                    padding: EdgeInsets.only(right: 8.0.w),
                    child: CustomIcon(
                        icon: suffixIcon,
                        size: 25,
                        color: AppColors.whiteColor))
              ]),

              // use simple hint if no list provided
              hintText: shouldUseAnimatedHints ? null : hintText,
              hintStyle: shouldUseAnimatedHints
                  ? null
                  : TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.whiteColor.withValues(alpha: 0.6))),
          focusNode: currFocus,
          canRequestFocus: true,
          textInputAction: nextFocusKey == null
              ? TextInputAction.done
              : TextInputAction.next,
          onFieldSubmitted: (_) {
            if (nextFocusKey != null) {
              final nextFocus = ref.read(focusNodeProvider(nextFocusKey!));
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currFocus.unfocus();
            }
          },
          validator: validator ?? (v) => Validators.requiredField(v)),

      // only when the hint list is not empty
      if (shouldUseAnimatedHints && controller.text.isEmpty)
        Positioned.fill(
            left: 0,
            right: 0,
            child: Padding(
                padding: EdgeInsets.only(
                    left: (contentPadding?.left ?? 12.w) + 40.w,
                    right: contentPadding?.right ?? 40.w,
                    top: contentPadding?.top ?? 12.h,
                    bottom: contentPadding?.bottom ?? 12.h),
                child: Align(alignment: Alignment.center, child: hintWidget)))
    ]);
  }
}
