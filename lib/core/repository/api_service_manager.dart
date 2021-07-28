import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


abstract class BaseApiService {
  Dio _dioClient;
  Dio _tokenDioClient;
  int timeout = 30 * 1000; // 30 seconds

  Dio getDioClient(
     ) {
    Dio dio;
    dio = _dioClient ??= _getDioClient();
    return dio;
  }


  Dio _getDioClient() {
    final dio = Dio(BaseOptions(
      connectTimeout: timeout,
      receiveTimeout: timeout,
    ));

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    }
    return dio;
  }

}
class GameApiServiceManager extends BaseApiService {
  GameApiServiceManager._privateConstructor();

  static final GameApiServiceManager instance =
  GameApiServiceManager._privateConstructor();
}
