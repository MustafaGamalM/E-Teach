import 'package:dartz/dartz.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CourseModel>>> getCourses();
}
