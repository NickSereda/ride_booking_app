import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_booking_app/core/presentation/base_shell/base_shell_widget.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/bookings_page.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/confirmation_page.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/home_page.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/map_page.dart';

@singleton
class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _shellNavigatorHomeKey = GlobalKey<NavigatorState>(
    debugLabel: 'shellHome',
  );
  final GlobalKey<NavigatorState> _shellNavigatorBookingsKey = GlobalKey<NavigatorState>(
    debugLabel: 'shellBookings',
  );

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: HomePage.routeName,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BaseShellWidget(navigationShell: navigationShell, child: navigationShell);
        },
        branches: [
          // Branch 1: Home (includes HomePage, MapsPage, ConfirmationPage)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: HomePage.routeName,
                name: HomePage.routeName,
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                    path: MapsPage.routeName,
                    name: MapsPage.routeName,
                    builder:
                        (context, state) => MapsPage(
                          isPickupQuery: state.uri.queryParameters[MapsPage.isPickupParam],
                        ),
                  ),
                  GoRoute(
                    path: ConfirmationPage.routeName,
                    name: ConfirmationPage.routeName,
                    builder: (context, state) => const ConfirmationPage(),
                  ),
                ],
              ),
            ],
          ),
          // Branch 2: Bookings (includes BookingsPage)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBookingsKey,
            routes: [
              GoRoute(
                path: BookingsPage.routeName,
                name: BookingsPage.routeName,
                builder: (context, state) => const BookingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static void goNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) => context.goNamed(
    name,
    pathParameters: pathParameters,
    queryParameters: queryParameters,
    extra: extra,
  );

  static void pop<T>({required BuildContext context, T? result}) => context.pop(result);
}
