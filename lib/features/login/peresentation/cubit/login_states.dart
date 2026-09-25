enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState {
  final LoginStatus status;
  final String? message;

  const LoginState({
    required this.status,
    this.message,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}