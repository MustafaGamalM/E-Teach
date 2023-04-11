import 'package:dartz/dartz.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/features/home/data/model/single_course_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CourseModel>> getCourses();

  Future<Either<Failure, SingleCourseModel>> getCourseById(int courseId);
}
