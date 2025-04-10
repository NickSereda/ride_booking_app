import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';


/// A router that manages the application's navigation.
@singleton
class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: CallsPage.routeName,
    routes: [
      GoRoute(
        path: HomePage.routeName,
        name: HomePage.routeName,
        builder: (context, state) => const HomePage(),
      ),
      // GoRoute(
      //   path: CreateCallPage.routeName,
      //   name: CreateCallPage.routeName,
      //   builder: (context, state) => const CreateCallPage(),
      // ),
    ],
  );
}
