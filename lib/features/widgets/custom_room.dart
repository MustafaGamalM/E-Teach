import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomRoonWidget extends StatelessWidget {
  const CustomRoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: AppSize.s18.h,
        height: AppSize.s18.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: AppSize.s3.h),
        padding: EdgeInsets.all(AppSize.s1.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s24),
            color: ColorManager.lightGrey),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            ImageAssets.onlineRoom,
            width: AppSize.s8.w,
            height: AppSize.s8.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: AppSize.s1.h,
          ),
          Text(
            'Room Name',
            style: getLightText(
                color: ColorManager.grey, fontSize: AppSize.s10.sp),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }
}
