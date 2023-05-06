import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/widgets/custom_error_view.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class VideosCourseView extends StatelessWidget {
  const VideosCourseView({super.key, required this.courseId});
  final int courseId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          title: Text(
            'Course Name',
            style: getSemiBoldText(
                color: ColorManager.white, fontSize: AppSize.s10.sp),
          ),
          centerTitle: false,
        ),
        body: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            if (state is GetCourseByIdSuccessfully) {
              return Padding(
                padding: EdgeInsets.all(AppPadding.p2.w),
                child: ListView.separated(
                  itemCount: state
                      .singleCourseModel.response!.data!.videoCourse!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //https://eteach.albayan-eg.com/files/photo_2023-03-19_18-19-09.jpg
                        Navigator.pushNamed(context, Routes.courseDetails);
                        print(
                            '${state.singleCourseModel.response!.data!.videoCourse![index].videos}');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(AppSize.s3.h),
                        child: Row(children: [
                          Text(
                            '${state.singleCourseModel.response!.data!.videoCourse![index].name}',
                            style: getMediumText(
                                color: ColorManager.black,
                                fontSize: AppSize.s8.sp),
                          ),
                          const Spacer(),
                          const Icon(Icons.play_arrow_rounded)
                        ]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: ColorManager.grey,
                      height: AppSize.s05,
                    );
                  },
                ),
              );
            } else if (State is GetCourseByIdFailed) {
              return CustomErrorWidget(
                  voidCallback: () =>
                      MainCubit.get(context).getCourseById(courseId));
            } else {
              return const CustomLoading();
            }
          },
        ));
  }
}
