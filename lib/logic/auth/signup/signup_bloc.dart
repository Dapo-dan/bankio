import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SelectOption>((event, emit) {
      emit(SignupReasonSelected(reason: event.reason));
    });

    on<VerifyIdentityEvent>((event, emit) {
      emit(VerifyIdentityState());
    });

    on<SubmitProofOfResidency>((event, emit) {
      emit(ProofOfResidencySubmitted());
    });

    on<SkipStep>((event, emit) {
      emit(StepSkipped());
    });
  }
}
