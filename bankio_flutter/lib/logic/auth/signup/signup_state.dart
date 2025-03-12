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
  final String? fullNameError;
  final TextEditingController? fullNameTC;
  final String nickName;
  final String? nickNameError;
  final TextEditingController? nickNameTC;
  final String email;
  final String? emailError;
  final TextEditingController? emailTC;
  final String phone;
  final String? phoneError;
  final TextEditingController? phoneTC;
  final FormSubmissionStatus? formStatus;

  ProfileCompletionState({
    this.fullName = '',
    this.fullNameError,
    this.fullNameTC,
    this.nickName = '',
    this.nickNameError,
    this.nickNameTC,
    this.email = '',
    this.emailError,
    this.emailTC,
    this.phone = '',
    this.phoneError,
    this.phoneTC,
    this.formStatus,
  });

  @override
  List<Object?> get props => [
        fullName,
        fullNameError,
        fullNameTC,
        nickName,
        nickNameError,
        nickNameTC,
        email,
        emailError,
        emailTC,
        phone,
        phoneError,
        phoneTC,
        formStatus,
      ];

  ProfileCompletionState copyWith({
    String? fullName,
    String? fullNameError,
    TextEditingController? fullNameTC,
    String? nickName,
    String? nickNameError,
    TextEditingController? nickNameTC,
    String? email,
    String? emailError,
    TextEditingController? emailTC,
    String? phone,
    String? phoneError,
    TextEditingController? phoneTC,
    final FormSubmissionStatus? formStatus,
  }) {
    return ProfileCompletionState(
      fullName: fullName ?? this.fullName,
      fullNameError: fullNameError,
      fullNameTC: fullNameTC ?? this.fullNameTC,
      nickName: nickName ?? this.nickName,
      nickNameTC: nickNameTC ?? this.nickNameTC,
      email: email ?? this.email,
      emailTC: emailTC ?? this.emailTC,
      phone: phone ?? this.phone,
      phoneTC: phoneTC ?? this.phoneTC,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
