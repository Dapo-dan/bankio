import 'package:bankio/blocs/auth_bloc/signup/signup_bloc.dart';
import 'package:bankio/presentation/widgets/button.dart';
import 'package:bankio/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FillProfilePage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).iconTheme.color),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fill your profile",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Don't worry, you can always change it later.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            TextInputForm(
              controller: fullNameController,
              label: "Full name",
            ),
            const SizedBox(height: 12),
            TextInputForm(
              controller: nickNameController,
              label: "Nick name",
            ),
            const SizedBox(height: 12),
            TextInputForm(
              controller: emailController,
              label: "Email",
            ),
            const SizedBox(height: 12),
            TextInputForm(
              controller: phoneController,
              label: "Phone number",
            ),
            const Spacer(),
            AppButton(
              title: "SUBMIT",
              onTap: () {
                context.read<SignupBloc>().add(
                      ProfileSubmitted(
                        fullName: fullNameController.text,
                        nickName: nickNameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      ),
                    );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
