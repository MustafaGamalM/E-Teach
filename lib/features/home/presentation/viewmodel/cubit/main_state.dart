part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class ScreenChangedSucceed extends MainState {}

// courses state

class GetCourseLoading extends MainState {}

class GetCourseFailed extends MainState {
  final String errorMessage;

  GetCourseFailed(this.errorMessage);
}

class GetCourseSuccessfully extends MainState {
  final List<CourseModel> courses;

  GetCourseSuccessfully(this.courses);
}
