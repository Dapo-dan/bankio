import 'package:bankio/logic/form_submission_status.dart';
import 'package:bankio/utils/validator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    /// Handle the selection of a reason for signing up, such as choosing a specific purpose or motivation for creating an account
    on<SelectOption>((event, emit) {
      emit(SignupReasonSelected(reason: event.reason));
    });

    /// Handle identity verification
    on<VerifyIdentityEvent>((event, emit) {
      emit(VerifyIdentityState());
    });

    /// Handle proof of residency submission
    on<SubmitProofOfResidency>((event, emit) {
      emit(ProofOfResidencySubmitted());
    });

    /// Handle the event to skip the current step in the signup process
    on<SkipStep>((event, emit) {
      emit(StepSkipped());
    });

    /// Handle proof of residency selection
    on<ProofOfResidencySelected>((event, emit) {
      emit(ProofOfResidencyState(event.method));
    });

    /// Handle photo capture event
    on<PhotoCaptured>((event, emit) {
      emit(PhotoCaptureState(event.photoPath));
    });

    /// Handle first name update
    on<SFullNameChanged>((event, emit) {
      if (state is ProfileCompletionState) {
        final currentState = state as ProfileCompletionState;
        final error = FullNameValidator.validateFullName(event.fullName);
        emit(currentState.copyWith(
            fullName: event.fullName, fullNameError: error));
      }
    });

    /// Handle last name update
    on<SNickNameChanged>((event, emit) {
      if (state is ProfileCompletionState) {
        final currentState = state as ProfileCompletionState;
        final error = UsernameValidator.validateUsername(event.nickName);
        emit(currentState.copyWith(
            nickName: event.nickName, nickNameError: error));
      }
    });

    /// Handle email update with validation
    on<SEmailChanged>((event, emit) {
      if (state is ProfileCompletionState) {
        final currentState = state as ProfileCompletionState;
        final error = EmailValidator.validateEmail(event.email);
        emit(currentState.copyWith(email: event.email, emailError: error));
      }
    });

    /// Handle phone number update
    on<SPhoneNumberChanged>((event, emit) {
      if (state is ProfileCompletionState) {
        final currentState = state as ProfileCompletionState;
        final error =
            PhoneNumberValidator.validatePhoneNumber(event.phoneNumber);
        emit(
            currentState.copyWith(phone: event.phoneNumber, phoneError: error));
      }
    });

    /// Handle profile submission
    on<ProfileSubmitted>((event, emit) {
      emit(ProfileCompletionState(
        fullName: event.fullName,
        nickName: event.nickName,
        email: event.email,
        phone: event.phone,
        fullNameTC: TextEditingController(text: event.fullName),
        nickNameTC: TextEditingController(text: event.nickName),
        emailTC: TextEditingController(text: event.email),
        phoneTC: TextEditingController(text: event.phone),
      ));
    });
  }
}
