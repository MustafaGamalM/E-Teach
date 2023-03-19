import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/features/home/data/repo/home_repo.dart';
import 'package:e_teach/features/home/presentation/view/home/screen/home_view.dart';
import 'package:e_teach/features/home/presentation/view/profile_view.dart';
import 'package:e_teach/features/home/presentation/view/screen1.dart';
import 'package:e_teach/features/home/presentation/view/screen2.dart';
import 'package:e_teach/features/home/presentation/view/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._homeRepo) : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  int page = 2;

  final HomeRepo _homeRepo;

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

  getCourses() async {
    emit(GetCourseLoading());
    var res = await _homeRepo.getCourses();
    res.fold((failure) {
      emit(GetCourseFailed(failure.errMessage));
    }, (courses) {
      emit(GetCourseSuccessfully(courses));
    });
  }
}
