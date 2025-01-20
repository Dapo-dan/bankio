part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class RememberMeToggled extends LoginEvent {
  final bool value;

  RememberMeToggled(this.value);

  @override
  List<Object?> get props => [value];
}

class Submitted extends LoginEvent {}
