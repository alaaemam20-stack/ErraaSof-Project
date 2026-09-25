import 'package:bloc/bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repo/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo)
      : super(
    const HomeState(
      status: HomeStatus.initial,
    ),
  );

  Future<void> getProducts() async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );

    final response = await _homeRepo.getProducts();

    switch (response) {
      case Success(data: final products):
        emit(
          state.copyWith(
            status: HomeStatus.success,
            products: products,
          ),
        );

      case Error(error: final error):
        emit(
          state.copyWith(
            status: HomeStatus.error,
            message: error.toString(),
          ),
        );
    }
  }
}