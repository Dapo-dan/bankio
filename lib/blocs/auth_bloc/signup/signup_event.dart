part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// User selects a reason
class SelectOption extends SignupEvent {
  final String reason;

  SelectOption(this.reason);

  @override
  List<Object?> get props => [reason];
}

// User verifies identity
class VerifyIdentityEvent extends SignupEvent {}

// User submits proof of residency
class SubmitProofOfResidency extends SignupEvent {}

// Skip any step
class SkipStep extends SignupEvent {}
