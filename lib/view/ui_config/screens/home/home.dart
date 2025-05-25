import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_icons.dart';
import 'package:skility_x/models/cards.dart';
import 'package:skility_x/view/screens/home/home_tab/0_home_tab.dart';
import 'package:skility_x/view/screens/home/news_tab/2_news_tab.dart';
import 'package:skility_x/view/screens/home/trachbox_tab/3_trackbox_tab.dart';
import 'package:skility_x/view/screens/home/proejct_tab/4_projects_tab.dart';
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

  // prepare data for saving into database
  static List<MusicCardsModel> getMusicCardData() {
    final production = MusicCardsModel(
        icon: AppImageIcons.production,
        title: "Music Production",
        subTitle: "CustomInstrumentals & film scoring",
        suffix: AppImageIcons.arrow,
        background: AppImageIcons.prodBg,
        navigateRoute: "production");
    final mixing = MusicCardsModel(
        icon: AppImageIcons.mixing,
        title: "Mixing & Mastering",
        subTitle: "Make your tracks Radio-ready",
        suffix: AppImageIcons.arrow,
        background: AppImageIcons.mixingBg,
        navigateRoute: "mixing");
    final lyrics = MusicCardsModel(
        icon: AppImageIcons.lyrics,
        title: "Lyrics Writing",
        subTitle: "Turn feelings into lyrics",
        suffix: AppImageIcons.arrow,
        background: AppImageIcons.lyricsBg,
        navigateRoute: "lyrics");
    final vocals = MusicCardsModel(
        icon: AppImageIcons.vocals,
        title: "Vocals",
        subTitle: "Vocals that bring your lyrics to life",
        suffix: AppImageIcons.arrow,
        background: AppImageIcons.vocalsBg,
        navigateRoute: "vocals");

    final List<MusicCardsModel> isList = [production, mixing, lyrics, vocals];
    return isList;
  }
}

class NavBarItems {
  final String icon;
  final String label;

  const NavBarItems({required this.icon, required this.label});
}
