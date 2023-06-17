import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/core/utilis/api_services/api_services.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/features/my_courses/data/model/add_course.dart';
import 'package:e_teach/features/my_courses/data/model/my_courses_model.dart';
import 'package:e_teach/features/my_courses/data/model/upload_video.dart';
import 'package:e_teach/features/my_courses/data/repo/my_course_repo.dart';

class MyCoursesRepoImpl implements MyCoursesRepo {
  final ApiService _apiService;
  final AppReference _appReference;

  MyCoursesRepoImpl(this._apiService, this._appReference);
  @override
  Future<Either<Failure, MyCoursesModel>> getMyCourses() async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.get(
          endPoint: AppConstants.myCoursesEndPoint, query: {"token": token});
      if (res['Response'] != null) {
        MyCoursesModel myCoursesModel = MyCoursesModel.fromJson(res);

        return Right(myCoursesModel);
      } else {
        return left(ServerFailure(res['Response']['msg']));
      }
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CreateCourseModel>> createMyCourses(
      String name) async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.post(
          endPoint: AppConstants.createCourseEndPoint,
          data: {"token": token, "name": name});
      if (res['Response']['statusCode'] == 200) {
        CreateCourseModel myCoursesModel = CreateCourseModel.fromJson(res);

        return Right(myCoursesModel);
      } else {
        return left(ServerFailure(res['Response']['msg']));
      }
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UploadVideoModel>> uploadMyCourse(
      FormData formData, Function(int, int) onProgress) async {
    try {
      var res = await _apiService.postFile(
          endPoint: AppConstants.uploadCourseEndPoint,
          data: formData,
          onProgress: onProgress);
      if (res['Response']['statusCode'] == 200) {
        UploadVideoModel myCoursesModel = UploadVideoModel.fromJson(res);
        return Right(myCoursesModel);
      } else {
        return left(ServerFailure(res['Response']['msg']));
      }
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
