import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_icons.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Building home screen');

    final screenHeight = Utils.getHeight(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: screenHeight * 0.4,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      AppColors.vibrantRedColor,
                      AppColors.darkRedColor
                    ])),
                alignment: Alignment.center,
                child: Text(
                  'Welcome to Home',
                  style: TextStyle(fontSize: 24.sp, color: Colors.white),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  spacing: 16.w,
                  children: [
                    Expanded(
                        child: myTextField(
                            prefixIcon: AppImageIcons.search,
                            suffixIcon: AppImageIcons.mic,
                            hintText: 'Search "Punjabi Lyrics"',
                            controllerKey: TextControllerKeys.search)),
                    CustomIcon(icon: AppImageIcons.avatar, size: 50),
                  ],
                ),
              ),
            ),
          ),

          /// Scrollable Content
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item ${index + 1}'),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
