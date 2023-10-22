part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class ChangeEmailEvent extends LoginEvent {
  const ChangeEmailEvent({required this.email});

  final String email;
}

class ChangePasswordEvent extends LoginEvent {
  const ChangePasswordEvent({required this.password});

  final String password;
}

class SubmitLoginEvent extends LoginEvent {}
