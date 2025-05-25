import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_icons.dart';
import 'package:skility_x/view/screens/home/1_home_tab.dart';
import 'package:skility_x/view/screens/home/2_news_tab.dart';
import 'package:skility_x/view/screens/home/3_trackbox_tab.dart';
import 'package:skility_x/view/screens/home/4_projects_tab.dart';
import 'package:skility_x/view/widgets/keep_alive_wrapper.dart';

class HomeConfig {
  static List<NavBarItems> getNavBarItemsModel() {
    return [
      NavBarItems(icon: AppImageIcons.home, label: "Home"),
      NavBarItems(icon: AppImageIcons.news, label: "News"),
      NavBarItems(icon: AppImageIcons.trachBox, label: "TrackBox"),
      NavBarItems(icon: AppImageIcons.projects, label: "Projects"),
    ];
  }

  static List<Widget> getScreens() {
    return [
      KeepAliveWrapper(body: HomeScreen()),
      KeepAliveWrapper(body: NewsScreen()),
      KeepAliveWrapper(body: TrackboxScreen()),
      KeepAliveWrapper(body: ProjectsScreen()),
    ];
  }
}

class NavBarItems {
  final String icon;
  final String label;

  const NavBarItems({required this.icon, required this.label});
}
