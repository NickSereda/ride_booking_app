import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_booking_app/features/ride_booking/architecture/cubit/ride_booking_cubit.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/widgets/booking_list_tile.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/widgets/bookings_empty_widget.dart';

class BookingsPage extends StatelessWidget {
  static const String routeName = '/bookings';

  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Bookings')),
      body: BlocBuilder<RideBookingCubit, RideBookingState>(
        builder: (context, state) {
          final bookings = state.bookings.data ?? [];

          if (bookings.isEmpty) {
            return BookingsEmptyWidget();
          }

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return BookingListTile(
                pickupAddress: booking.pickupAddress!,
                destinationAddress: booking.destinationAddress!,
                dateTime: booking.dateTime!,
              );
            },
          );
        },
      ),
    );
  }
}
