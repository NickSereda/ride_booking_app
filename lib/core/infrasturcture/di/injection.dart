import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_booking_app/core/infrasturcture/di/injection.config.dart';
import 'package:ride_booking_app/core/infrasturcture/env/env.dart';

final GetIt getIt = GetIt.instance;

/// Configures the dependencies of the application based on the current environment.
@InjectableInit()
Future<void> configureDependencies() async {
  final env = Env.environment;
  getIt.init(environment: env);
}
