import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/widgets/custom_course.dart';
import 'package:e_teach/features/widgets/custom_error_view.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:e_teach/features/widgets/custom_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomRoomsWidget extends StatefulWidget {
  const CustomRoomsWidget({super.key});

  @override
  State<CustomRoomsWidget> createState() => _CustomRoomsWidgetState();
}

class _CustomRoomsWidgetState extends State<CustomRoomsWidget> {
  @override
  void initState() {
    // BlocProvider.of<MainCubit>(context).getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CustomRoonWidget();
        },
        separatorBuilder: (context, index) => SizedBox(
          width: AppSize.s2.w,
        ),
      ),
    );
  }
}
