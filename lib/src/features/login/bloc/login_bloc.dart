import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<ChangeEmailEvent>(_onChangeEmailEventToState);
    on<ChangePasswordEvent>(_onChangePasswordEventToState);
    on<SubmitLoginEvent>(_onPressSubmitButtonEventToState);
  }

  FutureOr<void> _onChangeEmailEventToState(
    ChangeEmailEvent event,
    Emitter emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onChangePasswordEventToState(
    ChangePasswordEvent event,
    Emitter emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _onPressSubmitButtonEventToState(
    SubmitLoginEvent event,
    Emitter emit,
  ) async {
    print('press login button');
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    String email = state.email.trim();
    String password = state.password;
    if (email == 'ruhul@gmail.com' && password == '123456') {
      emit(state.copyWith(loginStatus: LoginStatus.success, errorMessage: ''));
    } else {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.fail,
          errorMessage: 'Login failed, please try again.',
        ),
      );
    }
  }


}
