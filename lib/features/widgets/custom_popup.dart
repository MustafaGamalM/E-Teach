import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/core/utilis/functions/dismiss_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

Future<void> customPopUp(BuildContext context,
    {String title = "",
    String errorMsg = "",
    required bool isLoading,
    VoidCallback? onPressed}) async {
  dismissDialog(context);
  return showDialog<void>(
    context: context,
    barrierDismissible: isLoading ? false : true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          errorMsg,
          maxLines: 2,
          style: TextStyle(
              color: ColorManager.black,
              fontSize: 14.sp,
              overflow: TextOverflow.ellipsis),
        ),
        content: LottieBuilder.asset(
            height: isLoading ? AppSize.s10.h : AppSize.s17.h,
            width: isLoading ? AppSize.s10.h : AppSize.s17.h,
            isLoading ? JsonAssets.cricleLoading : JsonAssets.error),
        actions: <Widget>[
          if (!isLoading)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  color: ColorManager.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.h)),
                  child: Text(AppStrings.close,
                      style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  color: ColorManager.yellow,
                  onPressed: onPressed,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.h)),
                  child: Text(AppStrings.retryAgain,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            )
        ],
      );
    },
  );
}
