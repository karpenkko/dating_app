import 'package:dating_app/pages/home_pages/profile_page.dart';
import 'package:dating_app/pages/home_pages/swipe_page.dart';
import 'package:dating_app/pages/home_pages/wrap_home_page.dart';
import 'package:dating_app/pages/start_pages/creating_profile_page.dart';
import 'package:dating_app/pages/start_pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => IntroPage(),
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
              builder: (context, state) => SwipePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'creating-profile',
              path: '/creating-profile',
              builder: (context, state) => CreatingProfilePage(),
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
