import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomLogoutButton extends StatelessWidget {
  final Function onPressed;
  const CustomLogoutButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w).copyWith(bottom: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(.07.h),
              decoration: BoxDecoration(
                  color: ColorManager.lightGrey,
                  borderRadius: BorderRadius.circular(2.h)),
              child: IconButton(
                color: ColorManager.babyBlue,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.logout,
                  size: 3.h,
                ),
                onPressed: () => onPressed(),
              )),
          SizedBox(width: 2.w),
          Text(
            AppStrings.logout.tr(),
            style: TextStyle(color: ColorManager.black, fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
