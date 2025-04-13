import 'package:dio/dio.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio;

  ApiService._(this.dio);

  static Future<ApiService> create() async {
    Duration timeOut = const Duration(seconds: 20);
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'lang': 'en',
        'Authorization': await CacheHelper.getSecuredString('token'),
      },
    );
    // addDioInterceptor();
    return ApiService._(dio);
  }

  // ApiService(this.dio) {
  //   dio.options = BaseOptions(
  //     connectTimeout: Duration(seconds: 20),
  //     receiveTimeout: Duration(seconds: 20),
  //     baseUrl: 'https://student.valuxapps.com/api/',
  //     receiveDataWhenStatusError: true,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'lang': 'ar',
  //       'Authorization': await CacheHelper.getSecuredString('token'),
  //     },
  //   );
  //   // addDioInterceptor();
  // }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(endPoint, queryParameters: query);
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(endPoint, queryParameters: query, data: data);
  }

  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await dio.put(endPoint, queryParameters: query, data: data);
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await dio.delete(endPoint, queryParameters: query);
  }

  void setTokenAfterLogin(String token) {
    dio.options.headers = {'Authorization': token};
  }

  void addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
