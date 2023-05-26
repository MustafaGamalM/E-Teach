import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/constants_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/features/onboarding/presntation/viewmodel/cubit/on_boarding_cubit.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/defalut_navigation_icon.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  AppReference appReference = instance<AppReference>();

  final PageController _pageController = PageController();

  final List<UserBoardingView> _onBoardingPage = [
    UserBoardingView(AppStrings.student.tr(), ImageAssets.studentBoarding,
        AppStrings.studentDescrition.tr()),
    UserBoardingView(AppStrings.instructor.tr(), ImageAssets.studentBoarding,
        AppStrings.instructorDescrition.tr()),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<OnBoardingCubit>(context);
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding:
                EdgeInsets.only(top: 5.h, left: 2.h, right: 2.h, bottom: 2.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                      appReference.onBoardingViewed();
                    },
                    child: Text(AppStrings.skip.tr()),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _onBoardingPage.length,
                    onPageChanged: (value) {
                      cubit.changePage(value);
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SvgPicture.asset(_onBoardingPage[index].image),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            _onBoardingPage[index].title,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(_onBoardingPage[index].body),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    if (cubit.currentPage >= _onBoardingPage.length - 1)
                      NavigtionIcon(() {
                        cubit.currentPage--;
                        _pageController.previousPage(
                            duration: const Duration(
                                seconds: ConstantsManager.animationTimePage),
                            curve: Curves.easeIn);
                      }, const Icon(Icons.arrow_back_sharp)),
                    const Spacer(),
                    NavigtionIcon(() {
                      if (cubit.currentPage >= _onBoardingPage.length) {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                        appReference.onBoardingViewed();
                      } else {
                        cubit.currentPage++;
                        _pageController.nextPage(
                            duration: const Duration(
                                seconds: ConstantsManager.animationTimePage),
                            curve: Curves.easeIn);
                      }
                    }, const Icon(Icons.arrow_forward))
                  ],
                )
              ],
            ),
          )),
        );
      },
    );
  }
}

class UserBoardingView {
  final String title;
  final String image;
  final String body;

  UserBoardingView(this.title, this.image, this.body);
}
