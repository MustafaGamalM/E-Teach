import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/search/data/model/search_model.dart';
import 'package:e_teach/features/widgets/custom_course.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomGridCourses extends StatelessWidget {
  CustomGridCourses({super.key, required this.courses});
  final List<SearchedDataCourses> courses;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: courses.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 20.h,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: AppSize.s4.w, // width
        mainAxisSpacing: AppSize.s2.h, // height
      ),
      itemBuilder: (context, index) {
        return CustomCourse(
            courseName: courses[index].name!,
            onTap: () {
              Navigator.pushNamed(context, Routes.courseDetails,
                  arguments: {"id": courses[index].id});
            });
      },
    );
  }
}
