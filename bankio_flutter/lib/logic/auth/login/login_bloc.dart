import 'package:bankio_flutter/utils/validator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GoRouter router;

  LoginBloc(this.router) : super(const LoginState()) {
    on<EmailChanged>((event, emit) {
      final emailError = EmailValidator.validateEmail(event.email);
      emit(state.copyWith(email: event.email, emailError: emailError));
    });

    on<PasswordChanged>((event, emit) {
      final passwordError = PasswordValidator.validatePassword(event.password);
      emit(state.copyWith(
          password: event.password, passwordError: passwordError));
    });

    on<RememberMeToggled>((event, emit) {
      emit(state.copyWith(rememberMe: event.value));
    });

    on<Submitted>((event, emit) {
      // Add authentication logic here
      if (state.emailError == null && state.passwordError == null) {
        if (kDebugMode) {
          router.go('/home');
        }
      }
    });
  }
}
