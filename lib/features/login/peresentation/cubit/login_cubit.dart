import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/model/login_model.dart';
import '../../data/repo/login_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo)
      : super(
    const LoginState(
      status: LoginStatus.initial,
    ),
  );

  Future<void> login(LoginRequestModel loginModel) async {
    emit(
      state.copyWith(
        status: LoginStatus.loading,
      ),
    );

    final response = await _loginRepo.login(loginModel);

    switch (response) {
      case Success(data: final message):
        emit(
          state.copyWith(
            status: LoginStatus.success,
            message: message.toString(),
          ),
        );

      case Error(error: final error):
        emit(
          state.copyWith(
            status: LoginStatus.error,
            message: error.toString(),
          ),
        );
    }
  }
}