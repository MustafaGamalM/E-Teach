import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final _baseUrl = 'http://127.0.0.1:8000/api/';
  final Dio _dio;

  ApiService(this._dio);

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
}
