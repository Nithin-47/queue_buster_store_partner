enum RouteNames {
  authLogin,
  authSignup,
  emailVerification,
  storeHome,
  menu,
  orders,
  menuAdd
}

extension RouteNamesHelper on RouteNames {
  String get path {
    switch (this) {
      case RouteNames.authLogin:
        return "/auth/login";
      case RouteNames.authSignup:
        return "/auth/signup";
      case RouteNames.emailVerification:
        return "/auth/email-verification";
      case RouteNames.storeHome:
        return "/";
      case RouteNames.menu:
        return "/menu";
      case RouteNames.orders:
        return "/orders";
      case RouteNames.menuAdd:
        return "/menuAdd";
    }
  }
}