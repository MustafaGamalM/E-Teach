import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/widgets/custom_course.dart';
import 'package:e_teach/features/widgets/custom_error_view.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:e_teach/features/widgets/custom_row_widget.dart';
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
        if (state is GetCourseLoading) {
          return const Center(child: CustomLoading());
        } else if (state is GetCourseSuccessfully) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomRowWidget(AppStrings.courses, () {
                Navigator.pushNamed(context, Routes.sellAllCoursesView,
                    arguments: {"courseModel": state.courses});
              }),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 22.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.courses.response!.data!.length,
                  itemBuilder: (context, index) {
                    return CustomCourse(
                      courseName: state.courses.response!.data![index].name!,
                      rate:
                          state.courses.response!.data![index].feedback!.length,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.courseDetails,
                            arguments: {
                              "id": state.courses.response!.data![index].id
                            });
                      },
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return CustomErrorWidget(
              voidCallback: () => MainCubit.get(context).getCourses());
        }
      },
    );
  }
}
