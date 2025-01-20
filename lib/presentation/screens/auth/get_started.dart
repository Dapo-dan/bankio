import 'package:bankio/blocs/auth_bloc/signup/signup_bloc.dart';
import 'package:bankio/presentation/screens/auth/verify_identity.dart';
import 'package:bankio/presentation/widgets/button.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).iconTheme.color),
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
                Text(
                  "Get started",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Tell us the main reason for using the FintechX application please.",
                  style: Theme.of(context).textTheme.bodyLarge,
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
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                            color: selectedOption == options[index]
                                ? Theme.of(context)
                                    .primaryColor
                                    .withValues(alpha: 0.2)
                                : Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selectedOption == options[index]
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).dividerColor,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selectedOption == options[index]
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: selectedOption == options[index]
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).dividerColor,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  options[index],
                                  style: Theme.of(context).textTheme.bodyLarge,
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
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
