import 'package:bankio/blocs/auth_bloc/login_bloc/login_bloc.dart';
import 'package:bankio/presentation/screens/auth/signup/get_started.dart';
import 'package:bankio/presentation/widgets/button.dart';
import 'package:bankio/presentation/widgets/social_login_button.dart';
import 'package:bankio/presentation/widgets/text_input_field.dart';
import 'package:bankio/utils/const.dart';
import 'package:bankio/utils/image_path.dart';
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
                "Forgot Your\nPassword",
                style: theme.textTheme.headlineMedium,
              ),
              Text(
                "No worries, you just need to type your email address oor username and we willl send the verification code.",
                style: theme.textTheme.bodySmall,
              ),
              verticalSpaceMedium(),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      TextInputForm(
                        hint: "Email",
                        errorText: state.emailError,
                        onChanged: (email) =>
                            context.read<LoginBloc>().add(EmailChanged(email)),
                      ),
                    ],
                  );
                },
              ),
              verticalSpaceMedium(),
              Row(
                children: [
                  Checkbox(
                    value: context.watch<LoginBloc>().state.rememberMe,
                    activeColor: theme.primaryColor,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(RememberMeToggled(value!));
                    },
                  ),
                  Text(
                    "Remember me",
                    style: theme.textTheme.bodySmall,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Reset password",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium(),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return AppButton(
                    allowSubmit: state.canSubmit,
                    onTap: () => context.read<LoginBloc>().add(
                          Submitted(),
                        ),
                    title: "SIGN IN",
                  );
                },
              ),
              verticalSpaceLarge(),
              Row(
                children: [
                  const Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "or continue with",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  const Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              verticalSpaceMedium(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialLoginButton2(
                    icon: ImagePath.facebook,
                  ),
                  SocialLoginButton2(
                    icon: ImagePath.google,
                  ),
                  SocialLoginButton2(
                    icon: ImagePath.apple,
                  ),
                ],
              ),
              verticalSpaceLarge(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: theme.textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GetStartedPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
