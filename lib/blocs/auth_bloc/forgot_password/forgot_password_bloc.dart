import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState()) {
    on<EmailChanged>((event, emit) {
      final emailError = event.email.contains('@') ? null : "Invalid email";
      emit(state.copyWith(email: event.email, emailError: emailError));
    });

    on<Submitted>((event, emit) {
      // Add authentication logic here
      if (state.emailError == null) {
        if (kDebugMode) {
          print("Send verification code: ${state.email}");
        }
      }
    });
  }
}
