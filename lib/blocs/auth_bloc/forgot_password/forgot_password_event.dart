part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmailChanged extends ForgotPasswordEvent {
  final String email;

  EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends ForgotPasswordEvent {
  final String password;

  PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class RememberMeToggled extends ForgotPasswordEvent {
  final bool value;

  RememberMeToggled(this.value);

  @override
  List<Object?> get props => [value];
}

class Submitted extends ForgotPasswordEvent {}
