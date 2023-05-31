import 'package:contact_management/presentation/pages/screens/DetailsScreen.dart';
import 'package:contact_management/presentation/pages/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const homeScreen = "/";

  static const detailsScreen = "/Details";

  static final GoRouter routes = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: homeScreen,
      builder: (BuildContext context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: detailsScreen,
        builder: (BuildContext context, GoRouterState state) {
          final title = state.queryParameters['title']!;
          return DetailsScreen(
            title: title,
          );
        }),
  ]);
}
