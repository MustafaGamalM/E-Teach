import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
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
      padding: EdgeInsets.all(AppPadding.p8.h),
      child: Column(
        children: [
          LottieBuilder.asset(
            JsonAssets.error,
            fit: BoxFit.cover,
            height: 20.h,
            width: 20.w,
          ),
          SizedBox(
            height: AppSize.s8.h,
          ),
          TextButton(
            child: Text(AppStrings.retryAgain),
            onPressed: voidCallback,
          )
        ],
      ),
    ));
  }
}
