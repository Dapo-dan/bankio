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

// User selects a proof of residency method
class ProofOfResidencySelected extends SignupEvent {
  final String method;

  ProofOfResidencySelected(this.method);

  @override
  List<Object?> get props => [method];
}

class PhotoCaptured extends SignupEvent {
  final String photoPath;

  PhotoCaptured(this.photoPath);

  @override
  List<Object?> get props => [photoPath];
}

class SFullNameChanged extends SignupEvent {
  final String fullName;
  SFullNameChanged({required this.fullName});
}

// Last Name Changed!
class SNickNameChanged extends SignupEvent {
  final String nickName;
  SNickNameChanged({required this.nickName});
}

// Email Changed!
class SEmailChanged extends SignupEvent {
  final String email;
  SEmailChanged({required this.email});
}

// Phone Number Changed!
class SPhoneNumberChanged extends SignupEvent {
  final String phoneNumber;
  SPhoneNumberChanged({required this.phoneNumber});
}

class ProfileSubmitted extends SignupEvent {
  final String fullName;
  final String nickName;
  final String email;
  final String phone;

  ProfileSubmitted({
    required this.fullName,
    required this.nickName,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [fullName, nickName, email, phone];
}
