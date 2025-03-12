part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final String email;
  final String? emailError;

  const ForgotPasswordState({
    this.email = '',
    this.emailError,
  });

  bool get canSubmit => email.isNotEmpty && emailError == null;

  ForgotPasswordState copyWith({
    String? email,
    String? emailError,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      emailError: emailError,
    );
  }

  @override
  List<Object?> get props => [email, emailError];
}
