import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>((event, emit) {
      final emailError = event.email.contains('@') ? null : "Invalid email";
      emit(state.copyWith(email: event.email, emailError: emailError));
    });

    on<PasswordChanged>((event, emit) {
      final passwordError =
          event.password.length >= 6 ? null : "Password too short";
      emit(state.copyWith(password: event.password, passwordError: passwordError));
    });

    on<RememberMeToggled>((event, emit) {
      emit(state.copyWith(rememberMe: event.value));
    });

    on<Submitted>((event, emit) {
      // Add authentication logic here
      if (state.emailError == null && state.passwordError == null) {
        if (kDebugMode) {
          print("Logging in with email: ${state.email}");
        }
      }
    });
  }
}
