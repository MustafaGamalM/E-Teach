import 'package:dio/dio.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(AppStrings.connectTimeOut.tr());
      case DioErrorType.sendTimeout:
        return ServerFailure(AppStrings.sendTimeOut.tr());
      case DioErrorType.receiveTimeout:
        return ServerFailure(AppStrings.receiveTimeOut.tr());
      case DioErrorType.badCertificate:
        return ServerFailure(AppStrings.badCertificate.tr());
      case DioErrorType.badResponse:
        return ServerFailure(AppStrings.badResponse.tr());
      case DioErrorType.cancel:
        return ServerFailure(AppStrings.requestCancled.tr());
      case DioErrorType.connectionError:
        return ServerFailure(AppStrings.connetionError.tr());
      case DioErrorType.unknown:
        return ServerFailure(AppStrings.unexpectedError.tr());
      // if (dioError.message.contains('SocketException')) {
      //   return ServerFailure('No Internet Connection');
      // } else {
      //   return ServerFailure('Unexpected Error, Please try again!');
      // }
      default:
        return ServerFailure(AppStrings.unKownError.tr());
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(AppStrings.notFoundRequest.tr());
    } else if (statusCode == 500) {
      return ServerFailure(AppStrings.internalServerError.tr());
    } else {
      return ServerFailure(AppStrings.unKownError.tr());
    }
  }
}
