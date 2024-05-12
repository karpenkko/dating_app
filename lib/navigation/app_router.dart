import 'package:dating_app/features/user_profile/ui/profile_page.dart';
import 'package:dating_app/features/swipe_cards/ui/swipe_page.dart';
import 'package:dating_app/features/user_connections/ui/connect_page.dart';
import 'package:dating_app/navigation/wrap_home_page.dart';
import 'package:dating_app/features/auth/ui/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/ui/signup_page.dart';
import '../features/auth/ui/login_page.dart';
import '../features/creating_profile/ui/creating_profile_page.dart';

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
      name: 'signup',
      path: '/signup',
      builder: (context, state) => const SignupPage(),
      routes: [
        GoRoute(
          name: 'login',
          path: 'login',
          builder: (context, state) => const LoginPage(),
        ),
      ]
    ),
    GoRoute(
      name: 'create-profile',
      path: '/create-profile',
      builder: (context, state) => const CreatingProfilePage(),
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
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
