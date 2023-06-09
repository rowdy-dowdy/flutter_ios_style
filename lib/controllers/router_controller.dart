import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_style/pages/ChildPage.dart';
import 'package:flutter_ios_style/pages/HomePage.dart';
import 'package:flutter_ios_style/pages/LoginPage.dart';
import 'package:flutter_ios_style/pages/SearchPage.dart';
import 'package:flutter_ios_style/pages/SettingsPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  final List<String> loginPages = ["/login"];

  RouterNotifier(this._ref) {
    // _ref.listen(authControllerProvider, 
    // (_, __) => notifyListeners());
  }

  String? _redirectLogin(_, GoRouterState state) {
    // final auth = _ref.read(authControllerProvider);
    
    // if (auth.authState == AuthState.initial) return null;

    // final areWeLoginIn = loginPages.indexWhere((e) => e == state.matchedLocation);

    // if (auth.authState != AuthState.login) {
    //   return areWeLoginIn >= 0 ? null : loginPages[0];
    // }

    // if (areWeLoginIn >= 0 || state.matchedLocation == "/loading") {
    //   return '/';
    // }

    // return null;    
  }

  List<RouteBase> get _routers => [
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),

    // pages logged
    ShellRoute(
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: "child",
              builder: (context, state) => const ChildPage(),
            ),
          ]
        ),
        GoRoute(
          path: "/settings",
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: "/search",
          builder: (context, state) => const SearchPage(),
        ),
      ]
    ),
  ];
}

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    initialLocation: "/login",
    debugLogDiagnostics: true,
    refreshListenable: router,
    // redirect: router._redirectLogin,
    routes: router._routers,
    // errorBuilder: ((context, state) => const ErrorPage() ),
  );
});