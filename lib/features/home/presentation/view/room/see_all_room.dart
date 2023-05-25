import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/features/widgets/custom_course.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SellAllRoomsView extends StatelessWidget {
  const SellAllRoomsView({super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.courses,
            style: getSemiBoldText(
                color: ColorManager.white, fontSize: AppSize.s10.sp),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
            child: GridView.builder(
              itemCount: courseModel.response!.data!.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 20.h,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: AppSize.s4.w, // width
                mainAxisSpacing: AppSize.s2.h, // height
              ),
              itemBuilder: (context, index) {
                return CustomCourse(
                    courseName: courseModel.response!.data![index].name!,
                    rate: 0,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.courseDetails,
                          arguments: {
                            "id": courseModel.response!.data![index].id
                          });
                    });
              },
            )));
  }
}
