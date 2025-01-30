import 'package:bankio/logic/auth/signup/signup_bloc.dart';
import 'package:bankio/presentation/widgets/button.dart';
import 'package:bankio/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FillProfilePage extends StatelessWidget {
  const FillProfilePage({super.key});

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
            _fullNameInput(),
            const SizedBox(height: 12),
            _nickNameInput(),
            const SizedBox(height: 12),
            _emailInput(),
            const SizedBox(height: 12),
            _phoneInput(),
            const Spacer(),
            _submit(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _fullNameInput() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        final profileState =
            state is ProfileCompletionState ? state : ProfileCompletionState();

        return TextInputForm(
          controller: profileState.fullNameTC ?? TextEditingController(),
          label: "Full Name",
          errorText: profileState.fullNameError,
          onChanged: (fullName) => context
              .read<SignupBloc>()
              .add(SFullNameChanged(fullName: fullName)),
        );
      },
    );
  }

  Widget _nickNameInput() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        final profileState =
            state is ProfileCompletionState ? state : ProfileCompletionState();

        return TextInputForm(
          controller: profileState.nickNameTC ?? TextEditingController(),
          label: "Nickname",
          errorText: profileState.nickNameError,
          onChanged: (nickName) => context
              .read<SignupBloc>()
              .add(SNickNameChanged(nickName: nickName)),
        );
      },
    );
  }

  Widget _emailInput() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        final profileState =
            state is ProfileCompletionState ? state : ProfileCompletionState();

        return TextInputForm(
          // controller: profileState.emailTC ?? TextEditingController(),
          label: "Email",
          errorText: profileState.emailError,
          onChanged: (email) =>
              context.read<SignupBloc>().add(SEmailChanged(email: email)),
        );
      },
    );
  }

  Widget _phoneInput() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        final profileState =
            state is ProfileCompletionState ? state : ProfileCompletionState();

        return TextInputForm(
          controller: profileState.phoneTC ?? TextEditingController(),
          label: "Phone Number",
          errorText: profileState.phoneError,
          onChanged: (phone) => context
              .read<SignupBloc>()
              .add(SPhoneNumberChanged(phoneNumber: phone)),
        );
      },
    );
  }

  Widget _submit() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        final profileState =
            state is ProfileCompletionState ? state : ProfileCompletionState();

        return AppButton(
          title: "SUBMIT",
          onTap: () {
            context.read<SignupBloc>().add(
                  ProfileSubmitted(
                    fullName: profileState.fullNameTC?.text ?? "",
                    nickName: profileState.nickNameTC?.text ?? "",
                    email: profileState.emailTC?.text ?? "",
                    phone: profileState.phoneTC?.text ?? "",
                  ),
                );
          },
        );
      },
    );
  }
}
