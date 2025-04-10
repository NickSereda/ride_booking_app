import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_booking_app/core/infrasturcture/router/app_router.dart';
import 'package:ride_booking_app/features/ride_booking/architecture/cubit/ride_booking_cubit.dart';

class MapsPage extends StatelessWidget {
  static const routeName = '/maps';
  static const isPickupParam = 'isPickup';

  final String? isPickupQuery;

  const MapsPage({super.key, required this.isPickupQuery});

  bool get isPickup => isPickupQuery == 'true';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(target: LatLng(37.7, -122.4), zoom: 10),
        onTap: (LatLng location) {
          if (isPickup) {
            context.read<RideBookingCubit>().updatePickupLocation(location);
          } else {
            context.read<RideBookingCubit>().updateDestinationLocation(location);
          }
          AppRouter.pop(context: context);
        },
      ),
    );
  }
}
