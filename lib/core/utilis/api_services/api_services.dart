import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/api_services/refresh_token_model.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dart:convert';

class ApiService {
  final Dio _dio;
  final AppReference _appRef;

  ApiService(this._dio, this._appRef) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await _appRef.getToken();
        options.headers['token'] = 'Bearer $token';
        return handler.next(options);
      },
      onError: (e, handler) async {
        print('caaaaaaallalalalal');
        print('Error: ${e.response?.statusCode}');
        if (e.response?.statusCode == 400 ||
            e.response?.statusCode == 401 ||
            e.response?.statusCode == 403 ||
            e.response?.statusCode == 500) {
          String? token = await _appRef.getToken();
          bool refreshTokenResult = await refreshToken(token);
          if (refreshTokenResult) {
            return handler.resolve(await _retry(e.requestOptions));
          }
        }
        return handler.next(e);
      },
    ));

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          error: true,
          request: true));
    }
  }

  Future<bool> refreshToken(String? token) async {
    final response = await _dio.post(
        '${AppConstants.baseUrlApi}${AppConstants.refreshToken}',
        data: {'token': token});
    final jsonResponse = json.decode(response.data);
    RefreshTokenModel baseResponse = RefreshTokenModel.fromJson(jsonResponse);
    if (baseResponse.response!.statusCode == 200) {
      await _appRef.setToken(baseResponse.response!.data!.token!);
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<Map<String, dynamic>> get(
      {required String endPoint,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    var response = await _dio.get(
      '${AppConstants.baseUrlApi}$endPoint',
      queryParameters: query,
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    var response = await _dio.post('${AppConstants.baseUrlApi}$endPoint',
        queryParameters: query, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> postFile(
      {required String endPoint,
      Map<String, dynamic>? query,
      required FormData data,
      required Function(int, int) onProgress}) async {
    var response = await _dio.post('${AppConstants.baseUrlApi}$endPoint',
        queryParameters: query, data: data, onSendProgress: onProgress);
    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required String endPoint,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    var response = await _dio.delete(
      '${AppConstants.baseUrlApi}$endPoint',
      queryParameters: query,
      data: data,
    );
    return response.data;
  }
}
