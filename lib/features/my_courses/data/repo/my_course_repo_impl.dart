import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/core/utilis/api_services.dart';
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
          endPoint: AppConstatns.myCoursesEndPoint, query: {"token": token});
      if (res['Response']['statusCode'] == 200) {
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
      var res = await _apiService.pos(
          endPoint: AppConstatns.createCourseEndPoint,
          data: {"token": token, "name": name});
      if (res['Response']['statusCode'] == 200) {
        CreateCourseModel myCoursesModel = CreateCourseModel.fromJson(res);

        return Right(myCoursesModel);
      } else {
        return left(ServerFailure(res['Response']['msg']));
      }
    } catch (e) {
      print('courseeeeeeeeeeeeeeeeeeeeee');
      print(e.toString());
      print('courseeeeeeeeeeeeeeeeeeeeee');
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
      FormData formData) async {
    try {
      var res = await _apiService.post2(
          endPoint: AppConstatns.uploadCourseEndPoint, data: formData);
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
