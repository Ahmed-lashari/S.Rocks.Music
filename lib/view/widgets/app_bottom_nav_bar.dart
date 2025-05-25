import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/view/ui_config/screens/home/home.dart';
import 'package:skility_x/view/widgets/custom_icons.dart';
import 'package:skility_x/view_model/ui_providers/screens/home/home.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar();

  @override
  ConsumerState<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends ConsumerState<CustomBottomNavigationBar> {
  List<NavBarItems> _navBarList = [];

  @override
  void initState() {
    super.initState();
    _navBarList = HomeConfig.getNavBarItemsModel();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('building whole nav bar');
    return Container(
        padding: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.navBarBorderColor)),
          color: AppColors.navBarBgColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
        ),
        child: Stack(children: [_buildIndicator(), _buildNavItems()]));
  }

  Widget _buildIndicator() {
    final double maxAlign = 0.88.w;
    final double boundries = 0.9.w;
    final int n = _navBarList.length;

    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Consumer(
        builder: (context, ref, child) {
          final selectedIndex = ref.watch(homeViewModelProvider);

          /// starting/emding point (-1 to 1)
          /// position (for each item (4 points))
          /// index (0 to 3)

          /// took help from gpt in handling the pixels but logic was my own
          /// gpt added the maxAlign variable
          final double yAlignment =
              -boundries + ((2 * maxAlign / (n - 1)) * selectedIndex);
          return AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment(yAlignment, 0),
              child: Container(
                  height: 7.h,
                  width: 14.w,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(50.r)))));
        },
      ),
    );
  }

  Widget _buildNavItems() {
    return Consumer(
      builder: (context, ref, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_navBarList.length, (index) {
            return GestureDetector(
              onTap: () =>
                  ref.read(homeViewModelProvider.notifier).setIndex(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),
                  Consumer(builder: (context, ref, _) {
                    final selectedIndex = ref.watch(homeViewModelProvider);

                    final isSelected = selectedIndex == index;
                    return CustomIcon(
                        icon: _navBarList[index].icon,
                        size: 22,
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.navBarUnselectedColor);
                  }),
                  Consumer(
                    builder: (context, ref, _) {
                      final selectedIndex = ref.watch(homeViewModelProvider);

                      final isSelected = selectedIndex == index;
                      return Text(_navBarList[index].label,
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.whiteColor
                                : AppColors.navBarUnselectedColor,
                            fontSize: 12.sp,
                          ));
                    },
                  )
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
