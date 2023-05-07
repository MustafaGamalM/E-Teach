part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class MyCoursesFailed extends CourseState {
  final String message;

  MyCoursesFailed(this.message);
}

class MyCoursesLoading extends CourseState {}

class MyCoursesSucess extends CourseState {
  final MyCoursesModel myCoursesModel;

  MyCoursesSucess(this.myCoursesModel);
}

// create course states

class CreateCourseFailed extends CourseState {
  final String message;

  CreateCourseFailed(this.message);
}

class CreateCourseLoading extends CourseState {}

class CreateCourseSucess extends CourseState {
  final CreateCourseModel courseModel;

  CreateCourseSucess(this.courseModel);
}

// upload course

class UploadCourseFailed extends CourseState {
  final String message;

  UploadCourseFailed(this.message);
}

class UploadCourseLoading extends CourseState {}

class UploadCourseSucess extends CourseState {
  final UploadVideoModel uploadVideoModel;

  UploadCourseSucess(this.uploadVideoModel);
}
