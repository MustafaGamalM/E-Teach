import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_teach/core/utilis/api_services/api_services.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/features/my_courses/data/model/add_course.dart';
import 'package:e_teach/features/my_courses/data/model/my_courses_model.dart';
import 'package:e_teach/features/my_courses/data/model/upload_video.dart';
import 'package:e_teach/features/my_courses/data/repo/my_course_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'course_state.dart';

class MyCoursesCubit extends Cubit<CourseState> {
  MyCoursesCubit(this._myCoursesRepo) : super(CourseInitial());
  final MyCoursesRepo _myCoursesRepo;
  static MyCoursesCubit get(context) => BlocProvider.of(context);
  getMyCourses() async {
    emit(MyCoursesLoading());
    var res = await _myCoursesRepo.getMyCourses();
    res.fold((failure) {
      emit(MyCoursesFailed(failure.errMessage));
    }, (courses) {
      emit(MyCoursesSucess(courses));
    });
  }

  createMyCourses(String name) async {
    emit(CreateCourseLoading());
    var res = await _myCoursesRepo.createMyCourses(name);
    res.fold((failure) {
      emit(CreateCourseFailed(failure.errMessage));
    }, (data) {
      emit(CreateCourseSucess(data));
    });
  }

  uploadMyCourses(FormData formData) async {
    emit(UploadCourseLoading());
    var res = await _myCoursesRepo.uploadMyCourse(formData);
    res.fold((failure) {
      print(failure.errMessage);
      emit(UploadCourseFailed(failure.errMessage));
    }, (data) {
      emit(UploadCourseSucess(data));
    });
  }

  int fullProg = 0;
  void updateProgress() {
    //print(fullProg);
    // change fullProg withb progress
    emit(ProgressChanged());
  }
}
