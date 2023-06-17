import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/widgets/custom_course.dart';
import 'package:e_teach/features/widgets/custom_error_view.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:e_teach/features/widgets/custom_row_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CustomCoursesWidget extends StatefulWidget {
  const CustomCoursesWidget({super.key});

  @override
  State<CustomCoursesWidget> createState() => _CustomCoursesWidgetState();
}

class _CustomCoursesWidgetState extends State<CustomCoursesWidget> {
  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        if (state is GetCourseFailed) {
          return CustomErrorWidget(
              voidCallback: () => MainCubit.get(context).getCourses());
        } else if (MainCubit.get(context).courseModel != null) {
          List<CoursesData> courses =
              MainCubit.get(context).courseModel!.response!.data!;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomRowWidget(AppStrings.courses.tr(), () {
                Navigator.pushNamed(context, Routes.sellAllCoursesView,
                    arguments: {
                      "courseModel": MainCubit.get(context).courseModel
                    });
              }),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 20.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return CustomCourse(
                      courseName: courses[index].name!,
                      rate: courses[index].feedback!.length,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.courseDetails,
                            arguments: {"id": courses[index].id});
                      },
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CustomLoading());
        }
      },
    );
  }
}
