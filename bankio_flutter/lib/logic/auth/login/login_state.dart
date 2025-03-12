part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final TextEditingController? emailController;
  final String password;
  final TextEditingController? passwordController;
  final bool rememberMe;
  final String? emailError;
  final String? passwordError;

  const LoginState({
    this.email = '',
    this.emailController,
    this.password = '',
    this.passwordController,
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

  LoginState copyWith({
    String? email,
    String? emailError,
    TextEditingController? emailController,
    String? password,
    String? passwordError,
    TextEditingController? passwordController,
    bool? rememberMe,
  }) {
    return LoginState(
      email: email ?? this.email,
      emailController: emailController ?? this.emailController,
      password: password ?? this.password,
      passwordController: passwordController ?? this.passwordController,
      rememberMe: rememberMe ?? this.rememberMe,
      emailError: emailError,
      passwordError: passwordError,
    );
  }

  @override
  List<Object?> get props => [
        email,
        emailController,
        password,
        passwordController,
        rememberMe,
        emailError,
        passwordError,
      ];
}
