import 'package:e_teach/features/home/presentation/view/home_screen.dart';
import 'package:e_teach/features/home/presentation/view/profile_screen.dart';
import 'package:e_teach/features/home/presentation/view/screen1.dart';
import 'package:e_teach/features/home/presentation/view/screen2.dart';
import 'package:e_teach/features/home/presentation/view/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int page = 2;

  List<Widget> mainScreen = [
    Screen1(),
    Screen2(),
    HomeScreen(),
    Screen3(),
    ProfileScreen()
  ];

  void changePage(int screenIndex) {
    page = screenIndex;
    emit(ScreenChangedSucceed());
  }
}
