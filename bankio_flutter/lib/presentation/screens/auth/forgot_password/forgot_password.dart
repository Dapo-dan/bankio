import 'package:bankio_flutter/logic/auth/forgot_password/forgot_password_bloc.dart';
import 'package:bankio_flutter/presentation/widgets/button.dart';
import 'package:bankio_flutter/presentation/widgets/text_input_field.dart';
import 'package:bankio_flutter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: theme.iconTheme.color),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BODY_PADDING),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceLarge(),
              Text(
                "Forgot Your\nPassword?",
                style: theme.textTheme.headlineMedium,
              ),
              verticalSpaceMedium(),
              Text(
                "No worries, you just need to type your email address oor username and we willl send the verification code.",
                style: theme.textTheme.bodySmall,
              ),
              verticalSpaceMedium(),
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      TextInputForm(
                        hint: "Email",
                        errorText: state.emailError,
                        onChanged: (email) => context
                            .read<ForgotPasswordBloc>()
                            .add(EmailChanged(email.trim().toLowerCase())),
                      ),
                    ],
                  );
                },
              ),
              verticalSpaceMedium(),
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                builder: (context, state) {
                  return AppButton(
                    allowSubmit: state.canSubmit,
                    onTap: () => context.read<ForgotPasswordBloc>().add(
                          Submitted(),
                        ),
                    title: "SUBMIT",
                  );
                },
              ),
              verticalSpaceLarge(),
            ],
          ),
        ),
      ),
    );
  }
}
