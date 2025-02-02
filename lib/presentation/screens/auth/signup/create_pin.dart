import 'package:bankio/logic/auth/forgot_password/forgot_password_bloc.dart';
import 'package:bankio/presentation/widgets/button.dart';
import 'package:bankio/presentation/widgets/text_input_field.dart';
import 'package:bankio/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({super.key});

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
                "Create new PIN",
                style: theme.textTheme.headlineMedium,
              ),
              verticalSpaceMedium(),
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                return Text(
                  "Add a PIN number to make your account more secure and easy to sign in.",
                  style: theme.textTheme.bodySmall,
                );
              }),
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
                            .add(EmailChanged(email)),
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
