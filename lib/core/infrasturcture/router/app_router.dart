import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/bookings_page.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/confirmation_page.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/home_page.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/map_page.dart';

@singleton
class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: HomePage.routeName,
        name: HomePage.routeName,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: MapsPage.routeName,
        name: MapsPage.routeName,
        builder: (context, state) => MapsPage(
          isPickupQuery: state.uri.queryParameters[MapsPage.isPickupParam],
        ),
      ),
      GoRoute(
        path: ConfirmationPage.routeName,
        name: ConfirmationPage.routeName,
        builder: (context, state) => const ConfirmationPage(),
      ),
      GoRoute(
        path: BookingsPage.routeName,
        name: BookingsPage.routeName,
        builder: (context, state) => const BookingsPage(),
      ),
    ],
  );
}