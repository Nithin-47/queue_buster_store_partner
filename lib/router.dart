import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:queue_buster_store_partner/constants/route_names.dart';

import 'package:queue_buster_store_partner/pages/menu.dart';
import 'package:queue_buster_store_partner/pages/more.dart';
import 'package:queue_buster_store_partner/pages/menuAdd.dart';

import 'package:queue_buster_store_partner/pages/orders.dart';
import 'package:queue_buster_store_partner/widgets/consumer_layout.dart';


final GoRouter goRouter =
    GoRouter(initialLocation: RouteNames.home.path, routes: [
  // GoRoute(
  //     path: RouteNames.authSignup.path,
  //     builder: (context, state) => const SignupPage()),
  // GoRoute(
  //     path: RouteNames.authLogin.path,
  //     builder: (context, state) => const LoginPage()),
  // GoRoute(
  //   path: RouteNames.emailVerification.path,
  //   builder: (context, state) => const EmailVerificationPage(),
  // ),

  // GoRoute(
  //   path: RouteNames.profile.path,
  //   builder: (context, state) => ProfilePage(),
  // ),


  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteNames.home.path,
                builder: (context, state) => const Orders()),
            // GoRoute(
            //     path: RouteNames.selectLocation.path,
            //     builder: (context, state) => const SelectLocationPage()),

          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteNames.orders.path,
                builder: (context, state) => const Menu()),
            GoRoute(
                path: RouteNames.menuAdd.path,
                builder: (context, state) => const menuAdd()
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteNames.menu.path,
                builder: (context, state) => const More()),
          ],
        ),
        // StatefulShellBranch(
        //   routes: <RouteBase>[
        //     GoRoute(
        //         path: RouteNames.settings.path,
        //         builder: (context, state) => const SettingsPage()),
        //   ],
        // ),
      ]),
]);
