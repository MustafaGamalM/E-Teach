import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserCoursesView extends StatefulWidget {
  const UserCoursesView({Key? key}) : super(key: key);

  @override
  State<UserCoursesView> createState() => _UserCoursesViewState();
}

class _UserCoursesViewState extends State<UserCoursesView> {
  // initstata
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          title: Text(
            AppStrings.yourLearining,
            style: getSemiBoldText(
                color: ColorManager.white, fontSize: AppSize.s10.sp),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(AppPadding.p2.w),
          child: ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.courseDetails);
                },
                child: Padding(
                    padding: EdgeInsets.all(AppSize.s3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mustafa gamal',
                          style: getMediumText(
                              color: ColorManager.black,
                              fontSize: AppSize.s4.sp),
                        ),
                        SizedBox(
                          height: AppSize.s1.h,
                        ),
                        Text(
                          'Course Name',
                          style: getMediumText(
                              color: ColorManager.grey2,
                              fontSize: AppSize.s4.sp),
                        ),
                        Text(
                          'rate 5',
                          style: getMediumText(
                              color: ColorManager.grey2,
                              fontSize: AppSize.s4.sp),
                        ),
                      ],
                    )),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: ColorManager.grey,
                height: AppSize.s05,
              );
            },
          ),
        ));
  }
}
