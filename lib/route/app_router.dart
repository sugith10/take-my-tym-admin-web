import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_my_tym_admin/route/page_names.dart';
import 'package:take_my_tym_admin/view/pages/error_page.dart';
import 'package:take_my_tym_admin/view/pages/main_page.dart';
import 'package:take_my_tym_admin/view/pages/login_page/log_in_page.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const ErrorPage(),
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const LogInPage(),
      redirect: (BuildContext context, GoRouterState state) {
        if (![
          "/${PageName.login}",
        ].contains(state.fullPath)) {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            return "/${PageName.login}";
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
      routes: <RouteBase>[
        GoRoute(
          path: PageName.login,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const LogInPage(),
          ),
        ),
        GoRoute(
          path: PageName.home,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context, state: state, child: const MainScreen()),
        )
      ],
    ),
  ],
);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
