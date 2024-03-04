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
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteNames.home.path,
                builder: (context, state) => const Orders()),
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
        )
      ]),
  ],
);
