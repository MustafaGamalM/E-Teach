import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> popDialog(BuildContext context,
    {String title = "", String errorMsg = "", required bool isLoading}) async {
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
          LottieBuilder.asset(
              isLoading ? JsonAssets.loading : JsonAssets.error),
          if (!isLoading)
            TextButton(
              child: Text(AppStrings.close,
                  style: Theme.of(context).textTheme.bodyLarge),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        ],
      );
    },
  );
}
