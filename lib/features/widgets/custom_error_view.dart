import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.voidCallback});

  final Future<void> Function() voidCallback;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              JsonAssets.error,
              //    fit: BoxFit.cover,
              height: AppSize.s24.h,
              width: AppSize.s24.h,
            ),
            SizedBox(
              height: AppSize.s1.h,
            ),
            TextButton(
              onPressed: voidCallback,
              child: Text(
                AppStrings.retryAgain,
                style: getMediumText(
                    color: Colors.black, fontSize: AppSize.s12.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
