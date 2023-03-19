import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LottieBuilder.asset(
      JsonAssets.error,
      fit: BoxFit.cover,
      height: 20.h,
      width: 20.w,
    ));
  }
}
