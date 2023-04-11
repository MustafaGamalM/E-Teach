import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomRoonWidget extends StatelessWidget {
  const CustomRoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 20.h,
        height: 20.h,
        padding: EdgeInsets.all(AppSize.s1.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s24),
            color: ColorManager.lightGrey),
        child: Column(children: [
          SvgPicture.asset(
            ImageAssets.studentBoarding,
            width: AppSize.s8.w,
            height: AppSize.s10.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: AppSize.s1.h,
          ),
          Text(
            'Rooom Name',
            style:
                getLightText(color: ColorManager.grey, fontSize: AppSize.s3.sp),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }
}
