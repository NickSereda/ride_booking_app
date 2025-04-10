// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ride_booking_app/core/infrasturcture/router/app_router.dart'
    as _i326;
import 'package:ride_booking_app/features/ride_booking/architecture/cubit/ride_booking_cubit.dart'
    as _i338;
import 'package:ride_booking_app/features/ride_booking/infrastructure/repository/dev_ride_booking_repository.dart'
    as _i913;
import 'package:ride_booking_app/features/ride_booking/infrastructure/repository/i_ride_booking_repository.dart'
    as _i826;

const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i326.AppRouter>(() => _i326.AppRouter());
    gh.lazySingleton<_i826.IRideBookingRepository>(
      () => _i913.DevRideBookingRepository(),
      registerFor: {_dev},
    );
    gh.factory<_i338.RideBookingCubit>(
      () => _i338.RideBookingCubit(gh<_i826.IRideBookingRepository>()),
    );
    return this;
  }
}
