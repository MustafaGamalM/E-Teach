import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MainCubit>(context);
        return Scaffold(
          backgroundColor: ColorManager.primary,
          body: SafeArea(child: cubit.mainScreen[cubit.page]),
          bottomNavigationBar: CurvedNavigationBar(
            items: [
              Icon(
                Icons.golf_course,
                color: ColorManager.white,
              ),
              Icon(
                Icons.list,
                color: ColorManager.white,
              ),
              Icon(
                Icons.home,
                color: ColorManager.white,
              ),
              Icon(
                Icons.person,
                color: ColorManager.white,
              ),
            ],
            backgroundColor: ColorManager.white,
            onTap: (int index) {
              cubit.changePage(index);
            },
            color: ColorManager.primary,
            animationDuration: const Duration(milliseconds: 300),
            index: 2,
          ),
        );
      },
    );
  }
}
