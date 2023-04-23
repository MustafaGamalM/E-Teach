import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomCourse extends StatelessWidget {
  const CustomCourse(
      {super.key, required this.courseName, required this.onTap});
  final String courseName;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSize.s24),
      child: Container(
        width: 20.h,
        height: 20.h,
        padding: EdgeInsets.all(AppPadding.p1.h),
        margin: EdgeInsets.all(AppPadding.p1.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s24),
            color: ColorManager.cien),
        child: Column(
          children: [
            SvgPicture.asset(
              ImageAssets.course,
              height: AppSize.s10.h,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              AppStrings.courseName + courseName,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: getMediumText(
                  color: ColorManager.black, fontSize: AppSize.s9.sp),
            )
          ],
        ),
      ),
    );
  }
}
