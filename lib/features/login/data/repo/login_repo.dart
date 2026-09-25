import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../model/login_model.dart';

class LoginRepo {
  final Dio _dio;

  LoginRepo(this._dio);

  Future<ApiResult<String>> login(
      LoginRequestModel loginModel,
      ) async {
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: loginModel.toJson(),
      );

      await saveToken(response.data['data']['token']);

      return Success<String>(
        response.data['message'],
      );
    } on DioException catch (e) {
      return Error<String>(
        ApiErrorHandler.handle(e).message,
      );
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
  }
}