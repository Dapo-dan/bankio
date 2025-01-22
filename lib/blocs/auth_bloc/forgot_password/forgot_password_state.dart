part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final String email;
  final String password;
  final bool rememberMe;
  final String? emailError;
  final String? passwordError;

  const ForgotPasswordState({
    this.email = '',
    this.password = '',
    this.rememberMe = false,
    this.emailError,
    this.passwordError,
  });

  bool get canSubmit =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      emailError == null &&
      passwordError == null &&
      rememberMe == true;

  ForgotPasswordState copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    String? emailError,
    String? passwordError,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      emailError: emailError,
      passwordError: passwordError,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, rememberMe, emailError, passwordError];
}
