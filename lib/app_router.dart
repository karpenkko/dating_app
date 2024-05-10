import 'package:dating_app/pages/home_pages/connect_page.dart';
import 'package:dating_app/features/switching_themes/ui/profile_page.dart';
import 'package:dating_app/features/swipe_cards/ui/swipe_page.dart';
import 'package:dating_app/pages/home_pages/wrap_home_page.dart';
import 'package:dating_app/pages/start_pages/intro_page.dart';
import 'package:dating_app/pages/start_pages/login_page.dart';
import 'package:dating_app/pages/start_pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'intro',
      path: '/',
      builder: (context, state) => const IntroPage(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          name: 'signup',
          path: 'signup',
          builder: (context, state) => const SignupPage(),
        ),
      ]
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavbar(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: [
            GoRoute(
              name: 'swipe',
              path: '/swipe',
              builder: (context, state) => const SwipePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'connect-page',
              path: '/connect-page',
              builder: (context, state) => const ConnectPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'profile',
              path: '/profile',
              builder: (context, state) => ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
