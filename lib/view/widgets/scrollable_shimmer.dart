import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skility_x/constants/app_colors.dart';

class ScrollableShimmer extends StatelessWidget {
  const ScrollableShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1.sw,
        height: 90.h,
        child: Container(
            margin: EdgeInsets.all(10.r),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            decoration: BoxDecoration(
                color: AppColors.cardMusicBg,
                borderRadius: BorderRadius.circular(20.r)),
            child: Shimmer.fromColors(
                baseColor: AppColors.navBarUnselectedColor,
                highlightColor: AppColors.whiteColor,
                child: Row(
                    spacing: 16.w,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // left section
                      Expanded(
                          child: Row(spacing: 16.w, children: [
                        // leading icon placeholder
                        Container(
                            height: 60.h,
                            width: 60.h,
                            decoration: BoxDecoration(
                                color: AppColors.blackColor,
                                borderRadius: BorderRadius.circular(15.r))),

                        // text placeholder
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10.h,
                                children: [
                              Container(
                                  height: 10.h,
                                  width: 0.4.sw,
                                  decoration: BoxDecoration(
                                      color: AppColors.blackColor,
                                      borderRadius:
                                          BorderRadius.circular(8.r))),
                              Container(
                                  height: 10.h,
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                      color: AppColors.blackColor,
                                      borderRadius: BorderRadius.circular(8.r)))
                            ]))
                      ])),

                      // trailing icon placeholder
                      Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color: AppColors.blackColor,
                              shape: BoxShape.circle))
                    ]))));
  }
}
