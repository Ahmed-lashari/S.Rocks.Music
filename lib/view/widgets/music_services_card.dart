import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/view/widgets/custom_icons.dart';

class MusicServiceCard extends StatelessWidget {
  final String leadingIconPath;
  final String trailingIconPath;
  final String title;
  final String subTitle;
  final String bgAsset;
  final String navigateRoute;
  const MusicServiceCard(
      {super.key,
      required this.leadingIconPath,
      required this.trailingIconPath,
      required this.title,
      required this.subTitle,
      required this.navigateRoute,
      required this.bgAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.navBarBgColor,
        border: Border.all(color: AppColors.cardMusicBorderColor),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              spacing: 16.w,
              children: [
                // leading icon
                Container(
                  padding: EdgeInsets.all(11.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.cardMusicBg,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    clipBehavior: Clip.none,
                    child: CustomIcon(
                      icon: leadingIconPath,
                      size: 30,
                    ),
                  ),
                ),

                // title + subtitle
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      Text(subTitle),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // trailing icon
          IconButton(
              icon: CustomIcon(icon: trailingIconPath, size: 17),
              onPressed: () => AppNavigator.navigateTo(context,
                  wRoute: getWidgetFromRoute(navigateRoute))),
        ],
      ),
    );
  }
}
