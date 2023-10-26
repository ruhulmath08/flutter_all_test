part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, fail }

class LoginState extends Equatable {
  const LoginState({
    this.loginStatus = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.errorMessage = '',
  });

  final LoginStatus loginStatus;
  final String email;
  final String password;
  final String errorMessage;

  LoginState copyWith({
    LoginStatus? loginStatus,
    String? email,
    String? password,
    String? errorMessage,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        loginStatus,
        email,
        password,
        errorMessage,
      ];
}
