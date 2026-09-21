import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_constants.dart';

class DioFactory {
  static late Dio _dio;

  static Future<Dio> getDio() async {
    const duration = Duration(seconds: 30);

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveTimeout: duration,
        connectTimeout: duration,
        sendTimeout: duration,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );

    return _dio;
  }
}