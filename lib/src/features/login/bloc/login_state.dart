part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, fail }

class LoginState extends Equatable {
  const LoginState({
    this.loginStatus = LoginStatus.initial,
    this.email = '',
    this.password = '',
  });

  final LoginStatus loginStatus;
  final String email;
  final String password;

  LoginState copyWith({
    LoginStatus? loginStatus,
    String? email,
    String? password,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [loginStatus, email, password];
}
