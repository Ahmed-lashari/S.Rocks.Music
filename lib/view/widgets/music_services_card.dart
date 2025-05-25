import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/view/themes/theme_constants.dart';
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
        height: 90.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardMusicBorderColor, width: 1.w),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(fit: StackFit.expand, children: [
              _buildBackgroundImage(),
              _buildCardContent(context)
            ])));
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      bgAsset,
      fit: BoxFit.cover,
    );
  }

  Widget _buildCardContent(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.r),
        color: AppColors.navBarBgColor.withValues(alpha: 0.9),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildLeftSection(), _buildTrailingIcon(context)]));
  }

  Widget _buildLeftSection() {
    return Expanded(
      child: Row(
          spacing: 16.w, children: [_buildLeadingIcon(), _buildTextSection()]),
    );
  }

  Widget _buildLeadingIcon() {
    return Expanded(
      flex: 3,
      child: Container(
          height: 1.sh,
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.cardMusicBg),
          child: ClipRRect(child: CustomIcon(icon: leadingIconPath, size: 30))),
    );
  }

  Widget _buildTextSection() {
    return Expanded(
        flex: 8,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontFamily: AppTypoGraphy.bold, fontSize: 16.sp)),
              Text(subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.sp))
            ]));
  }

  Widget _buildTrailingIcon(BuildContext context) {
    return IconButton(
        icon: CustomIcon(icon: trailingIconPath, size: 17),
        onPressed: () {
          AppNavigator.navigateTo(context,
              wRoute: getWidgetFromRoute(navigateRoute));
        });
  }
}
