import 'package:bankio/blocs/auth_bloc/forgot_password/forgot_password_bloc.dart';
import 'package:bankio/blocs/auth_bloc/login_bloc/login_bloc.dart';
import 'package:bankio/blocs/auth_bloc/signup/signup_bloc.dart';
import 'package:bankio/presentation/screens/auth/login/login_page.dart';
import 'package:bankio/presentation/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => ForgotPasswordBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Bankio',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme, // Light theme
        darkTheme: AppThemes.darkTheme, // Dark theme
        themeMode: ThemeMode.system, // Use system theme by default
        home: const LoginPage(),
      ),
    );
  }
}
