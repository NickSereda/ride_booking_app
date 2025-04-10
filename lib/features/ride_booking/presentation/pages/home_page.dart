import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_booking_app/core/infrasturcture/dialog_service/dialog_service.dart';
import 'package:ride_booking_app/features/ride_booking/architecture/cubit/ride_booking_cubit.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/confirmation_page.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/map_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  static final _formKey = GlobalKey<FormState>();

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideBookingCubit, RideBookingState>(
      buildWhen: (prevState, nextState) => prevState.currentBooking != nextState.currentBooking,
      builder: (context, state) {
        final booking = state.currentBooking.data;
        return Scaffold(
          appBar: AppBar(title: const Text('Book Ride')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Pickup Location',
                      border: const OutlineInputBorder(),
                      hintText: booking?.pickupAddress ?? 'Select pickup',
                    ),
                    onTap:
                        () => context.pushNamed(
                          MapsPage.routeName,
                          queryParameters: {MapsPage.isPickupParam: 'true'},
                        ),
                    validator:
                        (value) =>
                            booking?.pickupAddress.isEmpty ?? true
                                ? 'Please select pickup location'
                                : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Destination',
                      border: const OutlineInputBorder(),
                      hintText: booking?.destinationAddress ?? 'Select destination',
                    ),
                    onTap:
                        () => context.pushNamed(
                          MapsPage.routeName,
                          queryParameters: {MapsPage.isPickupParam: 'false'},
                        ),
                    validator:
                        (value) =>
                            booking?.destinationAddress.isEmpty ?? true
                                ? 'Please select destination'
                                : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Passengers',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        context.read<RideBookingCubit>().updatePassengerCount(int.parse(value));
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter passenger count';
                      final count = int.tryParse(value);
                      if (count == null || count <= 0) return 'Please enter a valid number';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Date & Time',
                      border: const OutlineInputBorder(),
                      hintText: booking?.dateTime.toString() ?? 'Select date and time',
                    ),
                    onTap:
                        () => DialogService.selectDateTime(context: context).then((dateTime) {
                          if (dateTime != null) {
                            if (context.mounted) {
                              context.read<RideBookingCubit>().updateDateTime(dateTime);
                            }
                          }
                        }),
                    validator:
                        (value) => booking?.dateTime == null ? 'Please select date and time' : null,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.push(ConfirmationPage.routeName);
                      }
                    },
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
