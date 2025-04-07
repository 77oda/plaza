import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String? token;

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'lang': 'ar',
        'Authorization': token ?? '',
      },
    );
    // addDioInterceptor();
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(endPoint, queryParameters: query);
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await _dio.post(endPoint, queryParameters: query, data: data);
  }

  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    // String? token,
  }) async {
    return await _dio.put(endPoint, queryParameters: query, data: data);
  }

  Future<Response> deleteData({
    required String endPoint,
    // String? token,
  }) async {
    // dio.options.headers = {'lang': 'en', 'Authorization': '$token'};
    return await _dio.delete(endPoint);
  }

  void setTokenAfterLogin(String token) {
    _dio.options.headers = {'Authorization': token};
  }

  void addDioInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
