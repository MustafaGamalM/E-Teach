import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomRoom extends StatelessWidget {
  const CustomRoom(
      {super.key,
      required this.courseName,
      required this.courseType,
      required this.onTap});
  final String courseName;
  final String courseType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s17),
          topRight: Radius.circular(AppSize.s17)),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s05.w, vertical: AppSize.s05.h),
        decoration: BoxDecoration(
            color: ColorManager.moveLight,
            gradient: LinearGradient(
              colors: [ColorManager.moveLight, ColorManager.white],
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s17),
                topRight: Radius.circular(AppSize.s17))),
        child: Column(
          children: [
            SvgPicture.asset(
              ImageAssets.roomProfile,
              width: AppSize.s4.h,
              height: AppSize.s4.h,
            ),
            SizedBox(
              height: AppSize.s1.h,
            ),
            Text(
              "Mohammed Aldsouq",
              style: getSemiBoldText(
                  color: ColorManager.white, fontSize: AppSize.s16),
            ),
            SizedBox(
              height: AppSize.s1.h,
            ),
            Text(
              "Pathyon",
              style: getSemiBoldText(
                  color: ColorManager.white, fontSize: AppSize.s16),
            ),
          ],
        ),
      ),
    );
  }
}
