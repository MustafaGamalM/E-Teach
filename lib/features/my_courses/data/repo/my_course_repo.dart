import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/features/my_courses/data/model/add_course.dart';
import 'package:e_teach/features/my_courses/data/model/my_courses_model.dart';
import 'package:e_teach/features/my_courses/data/model/upload_video.dart';

abstract class MyCoursesRepo {
  Future<Either<Failure, MyCoursesModel>> getMyCourses();
  Future<Either<Failure, CreateCourseModel>> createMyCourses(String name);
  Future<Either<Failure, UploadVideoModel>> uploadMyCourse(FormData formData);
}
