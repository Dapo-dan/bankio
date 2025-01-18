import 'package:bankio/blocs/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).iconTheme.color),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                "Let’s you in",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _SocialLoginButton(
                label: "Continue with Facebook",
                icon: Icons.facebook,
                color: Colors.blue[800],
              ),
              const SizedBox(height: 16),
              _SocialLoginButton(
                label: "Continue with Google",
                icon: Icons.g_mobiledata,
                color: Colors.red[600],
              ),
              const SizedBox(height: 16),
              const _SocialLoginButton(
                label: "Continue with Apple",
                icon: Icons.apple,
                color: Colors.black,
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) => LoginBloc(),
                        child: const SignInPage(),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text("SIGN IN WITH PASSWORD"),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text("Don’t have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;

  const _SocialLoginButton({
    required this.label,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: color),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: BorderSide(color: color ?? Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).cardColor,
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Sign in with password",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  children: [
                    TextField(
                      onChanged: (email) =>
                          context.read<LoginBloc>().add(EmailChanged(email)),
                      decoration: InputDecoration(
                        labelText: "Email",
                        errorText: state.emailError,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      onChanged: (password) => context
                          .read<LoginBloc>()
                          .add(PasswordChanged(password)),
                      decoration: InputDecoration(
                        labelText: "Password",
                        errorText: state.passwordError,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: context.watch<LoginBloc>().state.rememberMe,
                  onChanged: (value) {
                    context.read<LoginBloc>().add(RememberMeToggled(value!));
                  },
                ),
                const Text("Remember me"),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text("Reset password"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.canSubmit
                      ? () => context.read<LoginBloc>().add(Submitted())
                      : null,
                  child: const Text("SIGN IN"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
