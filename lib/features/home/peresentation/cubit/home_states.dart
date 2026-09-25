import '../../data/models/product_model.dart';
enum HomeStatus {
  initial,
  loading,
  success,
  error,
}
class HomeState {
  final HomeStatus status;
  final List<ProductModel> products;
  final String? message;

  const HomeState({
    required this.status,
    this.products = const [],
    this.message,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ProductModel>? products,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      message: message ?? this.message,
    );
  }
}