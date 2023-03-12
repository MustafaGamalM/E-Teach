import 'dart:async';

import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/constants_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../core/utilis/app_manager/app_reference.dart';
import '../../core/utilis/di.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppReference appReference = instance<AppReference>();

  Timer? _timer;
  void _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.timerDelay), _goNext);
  }

  _goNext() {
    if (appReference.sharedPreferences.getBool(ONBOARDING_VIEWED_KEY) == true) {
      if (appReference.sharedPreferences.getBool(LOGGEDIN_VIEWED_KEY) == true) {
        Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
      }
      Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
    }
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: SvgPicture.asset(ImageAssets.teachIc),
      ),
    );
  }
}
