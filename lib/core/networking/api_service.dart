import 'package:dio/dio.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';

class ApiService {
  static late Dio dio;

  // ApiService._()

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'ar',
          'Authorization': CacheHelper.getData('token'),
        },
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    // String? token,
  }) async {
    return await dio.get(endPoint, queryParameters: query);
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    // String? token,
  }) async {
    return await dio.post(endPoint, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    // String? token,
  }) async {
    return await dio.put(endPoint, queryParameters: query, data: data);
  }

  static Future<Response> deleteData({
    required String endPoint,
    // String? token,
  }) async {
    // dio.options.headers = {'lang': 'en', 'Authorization': '$token'};
    return await dio.delete(endPoint);
  }
}
