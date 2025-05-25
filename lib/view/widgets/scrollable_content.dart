import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/models/cards.dart';
import 'package:skility_x/view/widgets/music_services_card.dart';

class ScrollableCOntent extends StatefulWidget {
  final List<MusicCardsModel> list;
  const ScrollableCOntent({super.key, required this.list});

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
              Column(
                  children: List.generate(widget.list.length, (index) {
                final content = widget.list[index];
                return MusicServiceCard(
                    leadingIconPath: content.icon,
                    trailingIconPath: content.suffix,
                    title: content.title,
                    subTitle: content.subTitle,
                    bgAsset: content.background,
                    navigateRoute: content.navigateRoute);
              })),
              SizedBox.shrink()
            ]));
  }
}
