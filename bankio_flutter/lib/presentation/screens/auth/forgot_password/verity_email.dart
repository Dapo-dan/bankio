import 'package:bankio_flutter/logic/auth/forgot_password/forgot_password_bloc.dart';
import 'package:bankio_flutter/presentation/widgets/button.dart';
import 'package:bankio_flutter/presentation/widgets/text_input_field.dart';
import 'package:bankio_flutter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerityEmailScreen extends StatelessWidget {
  const VerityEmailScreen({super.key});

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
                "Enter Verification Code",
                style: theme.textTheme.headlineMedium,
              ),
              verticalSpaceMedium(),
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                return Text(
                  "Enter the code we sent to your email ${state.email}",
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
