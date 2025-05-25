import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_icons.dart';
import 'package:skility_x/view/widgets/music_services_card.dart';

class ScrollableCOntent extends StatefulWidget {
  const ScrollableCOntent({super.key});

  @override
  State<ScrollableCOntent> createState() => _ScrollableCOntentState();
}

class _ScrollableCOntentState extends State<ScrollableCOntent> {
  @override
  Widget build(BuildContext context) {
    return _ScrollableList();
  }

  Widget _ScrollableList() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
            spacing: 16.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hire hand-picked Pros for popular music services.",
                  style: TextStyle(fontSize: 15.sp),
                  textAlign: TextAlign.center),
              MusicServiceCard(
                  leadingIconPath: AppImageIcons.production,
                  trailingIconPath: AppImageIcons.arrow,
                  title: "Music Production",
                  subTitle: "Mixing & Mastering",
                  bgAsset: AppImageIcons.prodBg,
                  navigateRoute: 'production'),
              MusicServiceCard(
                  leadingIconPath: AppImageIcons.mixing,
                  trailingIconPath: AppImageIcons.arrow,
                  title: "Mixing & Mastering",
                  subTitle: "Make your track Radio-ready",
                  bgAsset: AppImageIcons.mixingBg,
                  navigateRoute: 'production'),
              MusicServiceCard(
                  leadingIconPath: AppImageIcons.lyrics,
                  trailingIconPath: AppImageIcons.arrow,
                  title: "Lyrics Writing",
                  subTitle: "Turn feelings into lyrics",
                  bgAsset: AppImageIcons.lyricsBg,
                  navigateRoute: 'production'),
              MusicServiceCard(
                  leadingIconPath: AppImageIcons.vocals,
                  trailingIconPath: AppImageIcons.arrow,
                  title: "Vocals",
                  subTitle: "Vocals that bring your lyrics to life.",
                  bgAsset: AppImageIcons.vocalsBg,
                  navigateRoute: 'production'),
              SizedBox.shrink()
            ]));
  }
}
