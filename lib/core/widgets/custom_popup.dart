import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/core/utilis/functions/dismiss_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> customPopUp(BuildContext context,
    {String title = "",
    String errorMsg = "",
    required bool isLoading,
    VoidCallback? onPressed}) async {
  dismissDialog(context);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: SingleChildScrollView(
          child: Text(errorMsg),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: AppSize.s200,
              width: AppSize.s200,
              child: LottieBuilder.asset(
                  isLoading ? JsonAssets.cricleLoading : JsonAssets.error),
            ),
          ),
          if (!isLoading)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  color: ColorManager.yellow,
                  child: Text(AppStrings.close,
                      style: Theme.of(context).textTheme.bodyLarge),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  color: ColorManager.yellow,
                  onPressed: onPressed,
                  child: Text(AppStrings.retryAgain,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            )
        ],
      );
    },
  );
}
