import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_icons.dart';
import 'package:skility_x/view-model/ui_providers/screens/home/home.dart';
import 'package:skility_x/view/screens/home/1_home_tab.dart';
import 'package:skility_x/view/screens/home/2_news_tab.dart';
import 'package:skility_x/view/screens/home/3_trackbox_tab.dart';
import 'package:skility_x/view/screens/home/4_projects_tab.dart';
import 'package:skility_x/view/widgets/custom_icons.dart';
import 'package:skility_x/view/widgets/keep_alive_wrapper.dart';

class HomeTabs extends ConsumerStatefulWidget {
  const HomeTabs({super.key});

  @override
  ConsumerState<HomeTabs> createState() => _HomeTabs();
}

class _HomeTabs extends ConsumerState<HomeTabs> {
  final _scrollController = ScrollController();
  final List<Widget> _pages = const [
    KeepAliveWrapper(body: HomeScreen()),
    KeepAliveWrapper(body: NewsScreen()),
    KeepAliveWrapper(body: TrackboxScreen()),
    KeepAliveWrapper(body: ProjectsScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    debugPrint('Building home tabs');

    final viewModel = ref.read(homeViewModelProvider.notifier);

    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final currentIndex = ref.watch(homeViewModelProvider);
        return _pages[currentIndex];
      }),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              final _currentPage = ref.watch(homeViewModelProvider);
              return DotCurvedBottomNav(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                scrollController: _scrollController,
                hideOnScroll: true,
                backgroundColor: AppColors.navBarBgColor,
                animationDuration: const Duration(milliseconds: 300),
                animationCurve: Curves.ease,
                selectedIndex: _currentPage,
                indicatorColor: AppColors.whiteColor,
                indicatorSize: 6.r,
                borderRadius: 0,
                height: 90.h,
                onTap: viewModel.setIndex,
                items: [
                  _buildItems(
                      icon: AppImageIcons.home,
                      text: "Home",
                      index: _currentPage,
                      color: _currentPage == 0
                          ? AppColors.whiteColor
                          : AppColors.navBarUnselectedColor),
                  _buildItems(
                      icon: AppImageIcons.news,
                      text: "News",
                      index: _currentPage,
                      color: _currentPage == 1
                          ? AppColors.whiteColor
                          : AppColors.navBarUnselectedColor),
                  _buildItems(
                      icon: AppImageIcons.trachBox,
                      text: "TrachBox",
                      index: _currentPage,
                      color: _currentPage == 2
                          ? AppColors.whiteColor
                          : AppColors.navBarUnselectedColor),
                  _buildItems(
                      icon: AppImageIcons.projects,
                      text: "Projects",
                      index: _currentPage,
                      color: _currentPage == 3
                          ? AppColors.whiteColor
                          : AppColors.navBarUnselectedColor),
                ],
              );
            },
          )),
    );
  }

  Widget _buildItems(
      {required String text,
      required String icon,
      required int index,
      required Color color}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomIcon(
          icon: icon,
          size: 25,
          color: color,
        ),
        Text(text, style: TextStyle(color: color, fontSize: 12.sp)),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
