import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomMyRoom extends StatelessWidget {
  const CustomMyRoom({super.key, required this.title, required this.desc});
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 13.h,
      decoration: BoxDecoration(
          color: ColorManager.grey2.withOpacity(.3),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SvgPicture.asset(
              ImageAssets.onlineRoom2,
              fit: BoxFit.cover,
              width: 10.w,
              height: 10.h,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  desc,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w200),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
