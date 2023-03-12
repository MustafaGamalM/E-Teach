import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AvaterWidget extends StatelessWidget {
  final String image;
  const AvaterWidget(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // todo : navigate to  profile screen
      },
      child: Container(
        width: 1.h,
        height: 1.h,
        margin: EdgeInsets.all(.70.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s360),
          border: Border.all(width: .2.h, color: ColorManager.yellow),
        ),
        child: ClipOval(
            child: Image.asset(
          'assets/images/Must.JPG',
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
