part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Initial state
class SignupInitial extends SignupState {}

// State when a reason is selected
class SignupReasonSelected extends SignupState {
  final String reason;

  SignupReasonSelected({required this.reason});

  @override
  List<Object?> get props => [reason];
}

// State for verifying identity
class VerifyIdentityState extends SignupState {}

// State after proof of residency is submitted
class ProofOfResidencySubmitted extends SignupState {}

// State when a step is skipped
class StepSkipped extends SignupState {}

class ProofOfResidencyState extends SignupState {
  final String method;

  ProofOfResidencyState(this.method);

  @override
  List<Object?> get props => [method];
}

class PhotoCaptureState extends SignupState {
  final String photoPath;

  PhotoCaptureState(this.photoPath);

  @override
  List<Object?> get props => [photoPath];
}

class ProfileCompletionState extends SignupState {
  final String fullName;
  final String nickName;
  final String email;
  final String phone;

  ProfileCompletionState({
    required this.fullName,
    required this.nickName,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [fullName, nickName, email, phone];
}
