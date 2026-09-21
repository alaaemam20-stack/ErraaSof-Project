import 'package:bloc/bloc.dart';
import 'package:eraasoft_project/features/register/peresentation/cubit/register_states.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/register_model.dart';
import '../../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo)
      : super(RegisterState(status: Status.initial));

  Future<void> register(RegisterRequestModel registerModel) async {
    emit(state.copyWith(status: Status.loading));

    final response = await _registerRepo.register(registerModel);

    switch (response) {
      case Success(data: final message):
        emit(
          state.copyWith(
            status: Status.success,
            message: message.toString(),
          ),
        );

      case Error(error: final error):
        emit(
          state.copyWith(
            status: Status.error,
            message: error.toString(),
          ),
        );
    }
  }
}