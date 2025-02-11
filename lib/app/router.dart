import 'package:bankio/presentation/screens/auth/forgot_password/forgot_password.dart';
import 'package:bankio/presentation/screens/auth/login/login_page.dart';
import 'package:bankio/presentation/screens/auth/signup/fill_profile_page.dart';
import 'package:bankio/presentation/screens/auth/signup/get_started.dart';
import 'package:bankio/presentation/screens/auth/signup/photo_id_page.dart';
import 'package:bankio/presentation/screens/auth/signup/proof_of_residency.dart';
import 'package:bankio/presentation/screens/auth/signup/verify_identity.dart';
import 'package:bankio/presentation/screens/home/home.dart';
import 'package:bankio/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/signup', builder: (context, state) => GetStartedPage()),
      GoRoute(
          path: '/signup/identity',
          builder: (context, state) => const VerifyIdentityPage()),
      GoRoute(
          path: '/signup/residency',
          builder: (context, state) => const ProofOfResidencyPage()),
      GoRoute(
          path: '/signup/photoid',
          builder: (context, state) => const PhotoIdPage()),
      GoRoute(
          path: '/signup/profile',
          builder: (context, state) => const FillProfilePage()),
      GoRoute(
          path: '/forgot-password',
          builder: (context, state) => const ForgotPasswordScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    ],
  );
}
