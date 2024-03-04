enum RouteNames {
  authSignup,
  authLogin,
  home,
}

extension RouteNamesHelper on RouteNames {
  String get path {
    switch(this) {
      case RouteNames.authSignup:
        return "/auth/signup";
      case RouteNames.authLogin:
        return "/auth/login";
        case RouteNames.home:
          return "/home";
    }
  }
}