import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/home/presentation/view/widgets/custom_courses_widget.dart';
import 'package:e_teach/features/home/presentation/view/widgets/custom_room.dart';
import 'package:e_teach/features/widgets/custom_row_widget.dart';
import 'package:e_teach/features/widgets/profile_widget.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final TextEditingController _searchTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      // appBar: AppBar(
      //   primary: true,
      //   leading: AvaterWidget(""),
      //   title: Text('Mustafa Gamal'),
      // ),
      body: Column(children: [
        SizedBox(height: 6.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.searchCourse);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s24),
              child: CustomAuthFormFiled(
                keyboardType: TextInputType.text,
                controller: _searchTextEditingController,
                labelText: AppStrings.searchCourse.tr(),
                enabled: false,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 2.h, right: 2.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s4.h),
                    topRight: Radius.circular(AppSize.s4.h)),
                color: ColorManager.white),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              // CustomRowWidget(AppStrings.courses, () {
              //   return print('click');
              // }),
              // SizedBox(
              //   height: 4.h,
              // ),
              const CustomCoursesWidget(),
              SizedBox(
                height: AppSize.s1.h,
              ),
              CustomRowWidget(AppStrings.rooms.tr(), () {
                return print('click');
              }),
              SizedBox(
                height: AppSize.s1.h,
              ),
              CustomRoomsWidget()
            ]),
          ),
        )
      ]),
    );
  }
}
