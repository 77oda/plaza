// import 'package:dio/dio.dart';

// class ApiService {
//   final _bas endpoint, = 'https://www.googleapis.com/books/v1/';
//   final Dio _dio;

//   ApiService(this._dio);

//   Future<Map<String, dynamic>> get({required String endPoint}) async {
//     var response = await _dio.get('$_bas endpoint,$endPoint');
//     return response.data;
//   }
// }

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    //print('dioHelper Initialized');
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? query,
    String? token,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };
    return await dio.get(endpoint, queryParameters: query);
  }

  static Future<Response> postData({
    required String endpoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };
    return await dio.post(endpoint, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String endpoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };
    return await dio.put(endpoint, queryParameters: query, data: data);
  }

  static Future<Response> deleteData({
    required String endpoint,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };
    return await dio.delete(endpoint);
  }
}
