enum RouteNames {
  authLogin,
  authSignup,
  home,
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
      case RouteNames.home:
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