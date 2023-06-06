import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AvaterWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  const AvaterWidget(this.image, {super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 1.h,
      height: height ?? 1.h,
      margin: EdgeInsets.only(top: .70.h, left: 1.5.w, right: 1.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s360),
        border: Border.all(width: .2.h, color: ColorManager.yellow),
      ),
      child: ClipOval(
          child: Image.asset(
        image,
        fit: BoxFit.cover,
      )),
    );
  }
}
