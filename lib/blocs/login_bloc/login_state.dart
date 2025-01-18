part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool rememberMe;
  final String? emailError;
  final String? passwordError;

  const LoginState({
    this.email = '',
    this.password = '',
    this.rememberMe = false,
    this.emailError,
    this.passwordError,
  });

  bool get canSubmit => emailError == null && passwordError == null;

  LoginState copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    String? emailError,
    String? passwordError,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      emailError: emailError,
      passwordError: passwordError,
    );
  }

  @override
  List<Object?> get props => [email, password, rememberMe, emailError, passwordError];
}
