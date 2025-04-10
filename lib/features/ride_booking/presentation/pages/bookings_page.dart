import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_booking_app/features/ride_booking/architecture/cubit/ride_booking_cubit.dart';

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
          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return ListTile(
                title: Text('From: ${booking.pickupAddress}'),
                subtitle: Text('To: ${booking.destinationAddress}'),
                trailing: Text(booking.dateTime.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
