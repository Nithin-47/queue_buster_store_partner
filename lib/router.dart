import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:queue_buster_store_partner/pages/login.dart';
import 'package:queue_buster_store_partner/pages/menu.dart';
import 'package:queue_buster_store_partner/pages/menu_add.dart';
import 'package:queue_buster_store_partner/pages/more.dart';
import 'package:queue_buster_store_partner/pages/orders.dart';
import 'package:queue_buster_store_partner/pages/signup.dart';
import 'package:queue_buster_store_partner/service/auth_service.dart';
import 'package:queue_buster_store_partner/widgets/consumer_layout.dart';

import 'constants/route_names.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: RouteNames.home.path,
  redirect: (context, goState) {
    final authService = GetIt.I<AuthService>();

    if(authService.currentUser == null && goState.uri.toString() != RouteNames.authSignup.path) {
      return RouteNames.authLogin.path;
    }
  },
  routes: [
    GoRoute(
      path: RouteNames.authSignup.path,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: RouteNames.authLogin.path,
      builder: (context, state) => const LoginPage(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return ConsumerLayout(child: child);
},
      routes: [
        GoRoute(
          path: RouteNames.home.path,
          builder: (context, state) => const Orders(),
        ),
        GoRoute(
          path: RouteNames.menu.path,
          builder: (context, state) => const MenuPage(),
        ),
        GoRoute(
          path: RouteNames.menuAdd.path,
          builder: (context, state) => const MenuAddPage()
        ),
        GoRoute(
          path: RouteNames.more.path,
          builder: (context, state) => const More(),
        ),
      ]
    ),
  //   StatefulShellRoute(
  //     navigatorContainerBuilder: (context, navigationShell, children) {
  //       return ScaffoldWithNavBar(navigationShell: navigationShell);
  //     },
  //     builder: (context, state, navigationShell) {
  //       return navigationShell;
  //     },
  //     branches: [
  //       StatefulShellBranch(
  //         routes: <RouteBase>[
  //           GoRoute(
  //               path: RouteNames.home.path,
  //               builder: (context, state) => const Orders()),
  //         ],
  //       ),
  //       StatefulShellBranch(
  //         routes: <RouteBase>[
  //           GoRoute(
  //               path: RouteNames.menu.path,
  //               builder: (context, state) => const MenuPage()),
  //           GoRoute(
  //               path: RouteNames.menuAdd.path,
  //               builder: (context, state) => const MenuAddPage()
  //           ),
  //         ],
  //       ),
  //       StatefulShellBranch(
  //         routes: <RouteBase>[
  //           GoRoute(
  //               path: RouteNames.more.path,
  //               builder: (context, state) => const More()),
  //         ],
  //       )
  //     ],
  ],
);
