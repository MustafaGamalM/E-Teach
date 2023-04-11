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
  final CourseModel courses;

  GetCourseSuccessfully(this.courses);
}

// get courses by id

class GetCourseByIdLoading extends MainState {}

class GetCourseByIdFailed extends MainState {
  final String errorMessage;

  GetCourseByIdFailed(this.errorMessage);
}

class GetCourseByIdSuccessfully extends MainState {
  final SingleCourseModel singleCourseModel;
  GetCourseByIdSuccessfully(this.singleCourseModel);
}
