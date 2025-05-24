import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_icons.dart';
import 'package:skility_x/view_model/ui_providers/screens/widgets/custom_icons.dart';

class CustomIcon extends ConsumerWidget {
  final String icon;
  final double? size;
  final Color? color;

  const CustomIcon({super.key, required this.icon, this.size, this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetCheck = ref.watch(assetCheckProvider(icon));

    return assetCheck.when(
      loading: () => SizedBox.shrink(),
      error: (_, __) => Icon(AppStaticIcons.error,
          size: size ?? 15.r, color: AppColors.vibrantRedColor),
      data: (exists) {
        if (exists) {
          if (icon.endsWith(".png")) {
            return Image.asset(
              '$icon',
              height: size?.h ?? 15.h,
              width: size?.w ?? 15.w,
              color: color,
            );
          }

          // .svg check
          else if (icon.endsWith(".svg")) {
            return SvgPicture.asset(
              "$icon",
              height: size?.h ?? 15.h,
              width: size?.w ?? 15.w,
              colorFilter: (color != null)
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            );
          }

          // other images check
          else {
            debugPrint("Picture from Others Image asset");
            return Image.asset(
              '$icon',
              height: size?.h ?? 15.h,
              width: size?.w ?? 15.w,
              color: color,
            );
          }
        } else {
          return Icon(AppStaticIcons.error, size: size ?? 15.r, color: color);
        }
      },
    );
  }
}
