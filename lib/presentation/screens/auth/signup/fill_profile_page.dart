import 'package:bankio/logic/auth/signup/signup_bloc.dart';
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
            _fullNameInput(),
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

  Widget _fullNameInput() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        // Ensure we are in ProfileCompletionState before accessing its properties
        final profileState =
            state is ProfileCompletionState ? state : ProfileCompletionState();

        return TextInputForm(
          controller: profileState.fullNameTC ??
              TextEditingController(), // Ensure a valid controller
          label: "Full name",
        );
      },
    );

    // Column(
    //   children: [
    //     Row(
    //       children: [
    //         Text(
    //           "First Name",
    //           style: Theme.of(context).textTheme.bodySmall!.copyWith(
    //                 fontWeight: FontWeight.w600,
    //                 color: Colors.black,
    //                 fontSize: 16,
    //               ),
    //         ),
    //       ],
    //     ),
    //     const SizedBox(height: 8),
    //     TextFormField(
    //       controller: state.fNameController,
    //       // initialValue: state.firstName,
    //       decoration: const InputDecoration(
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //           borderSide: BorderSide(color: Colors.black26, width: .5),
    //         ),
    //         enabledBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //           borderSide: BorderSide(color: Colors.black26, width: .5),
    //         ),
    //         hintText: "Precious",
    //         hintStyle: TextStyle(color: Colors.black12),
    //       ),
    //       validator: (value) =>
    //           state.isValidFirstName ? null : state.validityErrorFirstName,
    //       onChanged: (value) {
    //         context.read<RegistrationBloc>().add(
    //               REFirstNameChanged(firstName: value.trim().toLowerCase()),
    //             );
    //       },
    //       enabled: (state.formStatus is! FSSFormSubmitting),
    //     ),
    //   ],
    // );
  }
}
