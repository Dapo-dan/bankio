abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class FSSInitialFormStatus extends FormSubmissionStatus {
  const FSSInitialFormStatus();
}

class FSSFormSubmitting extends FormSubmissionStatus {}

class FSSSubmissionSuccess extends FormSubmissionStatus {}

class FSSSubmissionFailed extends FormSubmissionStatus {
  // final Exception exception;
  final Object exception;

  FSSSubmissionFailed({required this.exception});
}
