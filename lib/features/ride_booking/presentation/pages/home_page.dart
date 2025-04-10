import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_booking_app/core/infrasturcture/dialog_service/dialog_service.dart';
import 'package:ride_booking_app/features/ride_booking/architecture/cubit/ride_booking_cubit.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/confirmation_page.dart';
import 'package:ride_booking_app/features/ride_booking/presentation/pages/map_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final _formKey = GlobalKey<FormState>();
  late final TextEditingController _pickupController;
  late final TextEditingController _destinationController;
  late final TextEditingController _passengersController;
  late final TextEditingController _dateTimeController;

  @override
  void initState() {
    super.initState();
    _pickupController = TextEditingController();
    _destinationController = TextEditingController();
    _passengersController = TextEditingController();
    _dateTimeController = TextEditingController();
  }

  @override
  void dispose() {
    _pickupController.dispose();
    _destinationController.dispose();
    _passengersController.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RideBookingCubit, RideBookingState>(
      listenWhen: (prevState, nextState) => prevState.currentBooking != nextState.currentBooking,
      listener: (context, state) {
        final booking = state.currentBooking.data;
        _pickupController.text = booking?.pickupAddress ?? '';
        _destinationController.text = booking?.destinationAddress ?? '';
        _passengersController.text = booking?.passengerCount.toString() ?? '';
        _dateTimeController.text = booking?.dateTime.toString() ?? '';
      },
      buildWhen: (prevState, nextState) => prevState.currentBooking != nextState.currentBooking,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Book Ride')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _pickupController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Pickup Location',
                      border: OutlineInputBorder(),
                      hintText: 'Select pickup',
                    ),
                    onTap: () => context.pushNamed(
                      MapsPage.routeName,
                      queryParameters: {MapsPage.isPickupParam: 'true'},
                    ),
                    validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please select pickup location' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _destinationController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Destination',
                      border: OutlineInputBorder(),
                      hintText: 'Select destination',
                    ),
                    onTap: () => context.pushNamed(
                      MapsPage.routeName,
                      queryParameters: {MapsPage.isPickupParam: 'false'},
                    ),
                    validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please select destination' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passengersController,
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
                    controller: _dateTimeController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Date & Time',
                      border: OutlineInputBorder(),
                      hintText: 'Select date and time',
                    ),
                    onTap: () => DialogService.selectDateTime(context: context).then((dateTime) {
                      if (dateTime != null && context.mounted) {
                        context.read<RideBookingCubit>().updateDateTime(dateTime);
                      }
                    }),
                    validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please select date and time' : null,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.push(ConfirmationPage.routeName);
                      }
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
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