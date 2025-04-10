import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:ride_booking_app/core/infrasturcture/router/app_router.dart';
import 'package:ride_booking_app/core/presentation/theme/theme.dart';
import 'package:ride_booking_app/features/ride_booking/architecture/cubit/ride_booking_cubit.dart';
import 'core/infrasturcture/di/injection.dart';
import 'dart:js' as js;

// When you need the API key
String getMapsApiKey() {
  // Access the window.ENV.MAPS_API_KEY value
  return js.context['ENV']['MAPS_API_KEY'].toString();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the .env file
  await dotenv.load(fileName: '.env');

  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    print('APIKEYMAPS: ${getMapsApiKey()}');

    return BlocProvider<RideBookingCubit>(
      create: (_) => GetIt.I<RideBookingCubit>(),
      child: MaterialApp.router(
        routerConfig: appRouter.router,
        theme: LightTheme.data,
      ),
    );
  }
}
