import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/widgets/custom_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

class CustomGridCourses extends StatelessWidget {
  const CustomGridCourses({super.key, required this.itemCount});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 20.h,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: AppSize.s4.w, // width
        mainAxisSpacing: AppSize.s2.h, // height
      ),
      itemBuilder: (context, index) {
        return CustomCourse(courseName: 'test1', onTap: () {});
      },
    );
  }
}
