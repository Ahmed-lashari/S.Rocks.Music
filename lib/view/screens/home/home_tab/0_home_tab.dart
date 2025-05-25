import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_icons.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/themes/theme_constants.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_icons.dart';
import 'package:skility_x/view/widgets/scrollable_content.dart';
import 'package:skility_x/view/widgets/scrollable_shimmer.dart';
import 'package:skility_x/view_model/data_providers/screens/home/home_tab/0_home_tab.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                spacing: 16.h,
                children: [_CustomAppBar(context), _ScrollableContent()])));
  }

  Widget _CustomAppBar(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.r)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.vibrantRedColor, AppColors.darkRedColor])),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // display text field
          _buildSearchBar(context),

// textual scripts
          _buildTextualDetailsAndAssets()
        ]));
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
        color: AppColors.transparent,
        padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: Utils.getMediaQuery(context).padding.top + 10.h),
        child: Row(spacing: 16.w, children: [
          Expanded(
              child: myTextField(
                  prefixIcon: AppImageIcons.search,
                  suffixIcon: AppImageIcons.mic,
                  staticPrefix: "Search",
                  hintMessages: [
                    '"Punjabi Lyrics"',
                    '"Hindi Rap Vocals"',
                    '"Mix and master"',
                    '"Hip Hop Beats"',
                  ],
                  controllerKey: TextControllerKeys.search)),
          CustomIcon(icon: AppImageIcons.avatar, size: 45)
        ]));
  }

  Widget _buildTextualDetailsAndAssets() {
    return SizedBox(
        height: 230.h,
        child: Stack(
            alignment: Alignment.center,
            children: [_buildTextualDetails(), _buildAssets()]));
  }

  Widget _buildTextualDetails() {
    return Positioned(
        top: 0,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
                spacing: 0.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // claim your text
                  Text("Claim Your",
                      style: TextStyle(
                          fontFamily: AppTypoGraphy.bold, fontSize: 16.sp)),

                  // free demo text
                  Text("Free Demo",
                      style: TextStyle(
                          fontFamily: AppTypoGraphy.lobster, fontSize: 45.sp)),

                  // for Custom Music Production text
                  Text("for Custom Music Production",
                      style: TextStyle(
                          fontFamily: AppTypoGraphy.regular, fontSize: 16.sp)),
                ])));
  }

  Widget _buildAssets() {
    return Positioned(
        bottom: 0,
        left: -30,
        right: -30,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // disk asset
              CustomIcon(icon: AppImageIcons.disk, size: 130),

              // button
              ElevatedButton(
                  onPressed: () async {
                    // await HomeAction.saveData();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(110.w, 40.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                      backgroundColor: AppColors.whiteColor,
                      foregroundColor: AppColors.blackColor),
                  child: Text("Book Now",
                      style: TextStyle(fontFamily: AppTypoGraphy.bold))),

              // piano asset
              CustomIcon(icon: AppImageIcons.piano, size: 130)
            ]));
  }

  Widget _ScrollableContent() {
    return Consumer(builder: (context, ref, child) {
      final data = ref.watch(retriveCardsDataProvider);

      return data.when(
        error: (e, h) => Text(e.toString()),
        loading: () => ScrollableShimmer(),
        data: (data) {
          if (data.isEmpty)
            return Text(
              "No data available.\nPlease uncomment the Book Now botton function and press one time, after that refresh the app to retrive data.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.sp, fontFamily: AppTypoGraphy.bold),
            );
          return ScrollableCOntent(list: data);
        },
      );
    });
  }
}
