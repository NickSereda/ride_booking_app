import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ride_booking_app/core/domain/async_state/async_state.dart';
import 'package:ride_booking_app/core/infrasturcture/dialog_service/dialog_service.dart';
import 'package:ride_booking_app/features/ride_booking/architecture/cubit/ride_booking_cubit.dart';

class ConfirmationPage extends StatelessWidget {
  static const String routeName = '/confirmation';

  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RideBookingCubit, RideBookingState>(
      listener: (context, state) {
        if (state.currentBooking.status == const AsyncStatus.success()) {
          final shell = StatefulNavigationShell.of(context);
          // Reset the Home tab stack
          shell.goBranch(0, initialLocation: true);
        } else if (state.currentBooking.status == const AsyncStatus.failure()) {
          DialogService.showErrorSnackBar(
            context: context,
            message: 'Failed to confirm booking: ${state.currentBooking.failure?.message}',
          );
        }
      },
      builder: (context, state) {
        final booking = state.currentBooking.data;
        final isLoading = state.currentBooking.status == const AsyncStatus.loading();
        return Scaffold(
          appBar: AppBar(title: const Text('Confirm Booking')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pickup: ${booking?.pickupAddress}'),
                Text('Destination: ${booking?.destinationAddress}'),
                Text('Passengers: ${booking?.passengerCount}'),
                Text(
                  'Date: ${booking?.dateTime != null ? DateFormat('MMMM d, y HH:mm').format(booking!.dateTime!) : ''}',
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed:
                      isLoading ? null : () => context.read<RideBookingCubit>().submitBooking(),
                  child:
                      isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Confirm Booking'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
