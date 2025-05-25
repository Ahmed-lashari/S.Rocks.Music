import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_icons.dart';
import 'package:skility_x/view/widgets/custom_icons.dart';

class MusicServiceCard extends StatelessWidget {
  const MusicServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: AppColors.darkRedColor,
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        color: AppColors.cardMusicBg,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CustomIcon(
            icon: AppImageIcons.production,
            size: 30,
          ),
        ),
      ),
    );
    // Container(
    //   padding: EdgeInsets.all(10.r),
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(15.r),
    //       color: AppColors.darkRedColor),
    //   child: Row(
    //     children: [

    //     ],
    //   ),
    // );
  }
}
