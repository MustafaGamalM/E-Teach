import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/widgets/custom_row_widget.dart';
import 'package:e_teach/features/widgets/profile_widget.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchTextEditingController =
      TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        primary: true,
        leading: AvaterWidget(""),
        title: Text('Mustafa Gamal'),
      ),
      body: Column(children: [
        SizedBox(height: 6.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomAuthFormFiled(
            keyboardType: TextInputType.text,
            controller: _searchTextEditingController,
            labelText: AppStrings.searchCourse,
          ),
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 2.h, right: 2.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s24),
                    topRight: Radius.circular(AppSize.s24)),
                color: ColorManager.white),
            child: ListView(children: [
              CustomRowWidget(AppStrings.categories, () {
                return print('click');
              }),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 10.h,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic4.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                    SvgPicture.asset('assets/images/ic1.svg'),
                  ],
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
