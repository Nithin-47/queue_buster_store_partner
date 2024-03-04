import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:queue_buster_store_partner/constants/route_names.dart';
import 'package:queue_buster_store_partner/pages/login.dart';
import 'package:queue_buster_store_partner/pages/signup.dart';
import 'package:queue_buster_store_partner/service/auth_service.dart';

final GoRouter goRouter = GoRouter(
  redirect: (context, _) {
    final authService = GetIt.I<AuthService>();

    if(authService.currentUser == null) {
      return RouteNames.authLogin.path;
    }

    return RouteNames.home.path;
  },
  routes: [
    GoRoute(
      path: RouteNames.authSignup.path,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: RouteNames.authLogin.path,
      builder: (context, state) => const LoginPage(),
    )
  ],
);