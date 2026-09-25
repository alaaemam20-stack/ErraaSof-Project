import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/product_model.dart';

class HomeRepo {
  final Dio _dio;

  HomeRepo(this._dio);

  Future<ApiResult<List<ProductModel>>> getProducts() async {
    try {
      final response = await _dio.get(
        ApiConstants.products,
      );

      final List products = response.data['products'];

      final productList = products
          .map(
            (product) => ProductModel.fromJson(product),
      )
          .toList();

      return Success<List<ProductModel>>(productList);
    } on DioException catch (e) {
      return Error<List<ProductModel>>(
        ApiErrorHandler.handle(e).message as List<ProductModel>,
      );
    }
  }
}