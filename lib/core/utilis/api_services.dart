import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/core/utilis/refresh_token_model.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dart:convert';

class ApiService {
  final _baseUrl = 'https://eteach.albayan-eg.com/api/';
  final Dio _dio;
  final AppReference _appRef;

  ApiService(this._dio, this._appRef) {
    _dio.interceptors.add(InterceptorsWrapper(
      // onRequest: (options, handler) async {
      //   // options.headers['Authorization'] = "Bearer";
      //   print('mustafa caaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaal');
      // },
      onError: (e, handler) async {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee on error');
        if (e.response?.statusCode == 401) {
          String? token = await _appRef.getToken();
          if (token != null) {
            if (await _refreshToken(
              token,
            )) {
              return handler.resolve(await _retry(e.requestOptions));
            }
          }
        }
      },
    ));

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
  }
  Future<bool> _refreshToken(String token) async {
    final response = await _dio.post(AppConstatns.refreshToken, data: {
      'token': token,
    });
    final jsonResponse = json.decode(response.data);
    RefreshTokenModel baseResponse = RefreshTokenModel.fromJson(jsonResponse);
    if (baseResponse.response!.statusCode == 200) {
      _appRef.setToken(baseResponse.response!.data!.token!);
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
      '$_baseUrl$endPoint',
      queryParameters: query,
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> pos(
      {required String endPoint,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        queryParameters: query, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> post2(
      {required String endPoint,
      Map<String, dynamic>? query,
      required FormData data}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        queryParameters: query, data: data);
    return response.data;
  }
}
