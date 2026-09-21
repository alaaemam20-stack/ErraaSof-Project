import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/register_model.dart';

class RegisterRepo {
  final Dio _dio;

  RegisterRepo(this._dio);

  Future<ApiResult<String>> register(
      RegisterRequestModel registerModel,
      ) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: registerModel.toJson(),
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