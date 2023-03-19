import 'package:dio/dio.dart';
import 'package:e_teach/core/utilis/api_services.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/constants_manager.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_teach/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  final AppReference _appReference;
  HomeRepoImpl(this._apiService, this._appReference);

  @override
  Future<Either<Failure, List<CourseModel>>> getCourses() async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.getList(
          endPoint: AppConstants.coursesEndPoint, query: {"token": token});
      List<CourseModel> courses = [];
      for (var course in res) {
        courses.add(CourseModel.fromJson(course));
      }
      return Right(courses);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
