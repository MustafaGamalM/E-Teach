import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';

class ApiServicePayMob {
  // pay mob

  static Dio dio = Dio(
    BaseOptions(
        baseUrl: AppConstants.baseUrl,
        headers: {"Content-Type": "application/json"},
        receiveDataWhenStatusError: true),
  );

  Future<Response> postPayMob(
      {required String endPoint, Map<String, dynamic>? data}) async {
    return await dio.post(endPoint, data: data);
  }
}
