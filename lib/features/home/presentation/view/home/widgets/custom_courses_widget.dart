import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/widgets/custom_error.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CustomCoursesWidget extends StatelessWidget {
  const CustomCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        if (state is GetCourseLoading) {
          return const CustomLoading();
        } else if (state is GetCourseSuccessfully) {
          return SizedBox(
            height: 10.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.courses.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 20.h,
                  height: 20.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s24),
                      color: ColorManager.cien),
                  child: Text(state.courses[index].name!),
                );
              },
            ),
          );
        } else {
          return const CustomErrorWidget();
        }
      },
    );
  }
}
