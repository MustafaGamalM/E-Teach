import 'package:e_teach/features/course/presentation/view/course_videos_view.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/features/home/data/model/single_course_model.dart';
import 'package:e_teach/features/home/data/repo/home_repo.dart';
import 'package:e_teach/features/home/presentation/view/home_view.dart';
import 'package:e_teach/features/profile/presentation/view/profile_view.dart';
import 'package:e_teach/features/rooms/presentation/view/room_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._homeRepo) : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  int page = 2;

  final HomeRepo _homeRepo;

  List<Widget> mainScreen = [
    const RoomView(),
    const UserCoursesView(),
    HomeView(),
    const ProfileView()
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

  getCourseById(int courseId) async {
    emit(GetCourseByIdLoading());
    var res = await _homeRepo.getCourseById(courseId);
    res.fold((failure) {
      emit(GetCourseByIdFailed(failure.errMessage));
    }, (course) {
      emit(GetCourseByIdSuccessfully(course));
    });
  }
}
