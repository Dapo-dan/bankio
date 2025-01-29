import 'package:bankio/logic/auth/signup/signup_bloc.dart';
import 'package:bankio/presentation/screens/auth/signup/verify_identity.dart';
import 'package:bankio/presentation/widgets/button.dart';
import 'package:bankio/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetStartedPage extends StatelessWidget {
  final List<String> options = [
    "Spend or save daily",
    "Spend while travelling",
    "Send and manage money",
    "Gain exposure to financial assets",
    "Others",
  ];

  GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: theme.iconTheme.color),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          String? selectedOption;

          if (state is SignupReasonSelected) {
            selectedOption = state.reason;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceLarge(),
                Text(
                  "Get started",
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "Tell us the main reason for using Bankio please.",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<SignupBloc>()
                              .add(SelectOption(options[index]));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: selectedOption == options[index],
                                onChanged: (bool? value) {
                                  if (value == true) {
                                    context
                                        .read<SignupBloc>()
                                        .add(SelectOption(options[index]));
                                  }
                                },
                                activeColor: theme.primaryColor,
                              ),
                              horizontalSpaceSmall(),
                              Expanded(
                                child: Text(
                                  options[index],
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        onTap: () {
                          context.read<SignupBloc>().add(SkipStep());
                        },
                        title: "SKIP",
                        textColor: theme.colorScheme.onSecondaryContainer,
                        buttonColor: theme.colorScheme.primaryContainer,
                        borderColor: theme.colorScheme.secondaryContainer,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppButton(
                        onTap: selectedOption != null
                            ? () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const VerifyIdentityPage(),
                                  ),
                                )
                            : () {},
                        title: "CONTINUE",
                      ),
                    ),
                  ],
                ),
                verticalSpaceLarge(),
              ],
            ),
          );
        },
      ),
    );
  }
}
