import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(JsonAssets.loading,
            height: 15.h, width: 15.w, fit: BoxFit.cover));
  }
}
