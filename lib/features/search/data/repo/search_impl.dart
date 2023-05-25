import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_teach/core/utilis/api_services/api_services.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/features/search/data/model/search_model.dart';
import 'package:e_teach/features/search/data/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService _apiService;

  final AppReference _appReference;
  SearchRepoImpl(this._apiService, this._appReference);
  @override
  Future<Either<Failure, SearchModel>> search(String courseName) async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.pos(
          endPoint: AppConstatns.searchCourseEndPoint,
          data: {"token": token, "name": courseName});
      SearchModel model = SearchModel.fromJson(res);
      return Right(model);
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
