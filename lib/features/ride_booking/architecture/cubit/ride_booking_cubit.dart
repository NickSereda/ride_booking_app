import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_booking_app/core/domain/async_state/async_state.dart';
import 'package:ride_booking_app/core/domain/failure/failure.dart';
import 'package:ride_booking_app/features/ride_booking/domain/booking.dart';
import 'package:ride_booking_app/features/ride_booking/infrastructure/repository/i_ride_booking_repository.dart';

part 'ride_booking_cubit.freezed.dart';

part 'ride_booking_state.dart';

@injectable
class RideBookingCubit extends Cubit<RideBookingState> {
  final IRideBookingRepository _repository;
  late final StreamSubscription _bookingsSubscription;

  RideBookingCubit(this._repository) : super(RideBookingState.initial()) {
    _bookingsSubscription = _repository.getBookings().listen((bookings) {
      emit(state.copyWith(bookings: AsyncState.success(bookings)));
    });
  }

  @override
  Future<void> close() {
    _bookingsSubscription.cancel();
    return super.close();
  }

  Future<void> updatePickupLocation(LatLng location) async {
    try {
      final address = await _repository.getAddressFromLatLng(location);
      final booking = state.currentBooking;
      final bookingData = state.currentBooking.data;

      emit(
        state.copyWith(
          currentBooking: booking.copyWith(
            data: Booking(
              pickupLocation: location,
              pickupAddress: address,
              destinationLocation: bookingData?.destinationLocation ?? const LatLng(0, 0),
              destinationAddress: bookingData?.destinationAddress ?? '',
              passengerCount: bookingData?.passengerCount ?? 1,
              dateTime: bookingData?.dateTime ?? DateTime.now(),
            ),
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(currentBooking: AsyncState.failure(Failure.general(e.toString()))));
    }
  }

  Future<void> updateDestinationLocation(LatLng location) async {
    try {
      final address = await _repository.getAddressFromLatLng(location);
      final booking = state.currentBooking;
      final bookingData = state.currentBooking.data;
      emit(
        state.copyWith(
          currentBooking: booking.copyWith(
            data: Booking(
              pickupLocation: bookingData?.pickupLocation ?? const LatLng(0, 0),
              pickupAddress: bookingData?.pickupAddress ?? '',
              destinationLocation: location,
              destinationAddress: address,
              passengerCount: bookingData?.passengerCount ?? 1,
              dateTime: bookingData?.dateTime ?? DateTime.now(),
            ),
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(currentBooking: AsyncState.failure(Failure.general(e.toString()))));
    }
  }

  void updatePassengerCount(int count) {
    final booking = state.currentBooking;
    final bookingData = state.currentBooking.data;
    emit(
      state.copyWith(
        currentBooking: booking.copyWith(
          data: Booking(
            pickupLocation: bookingData?.pickupLocation ?? const LatLng(0, 0),
            pickupAddress: bookingData?.pickupAddress ?? '',
            destinationLocation: bookingData?.destinationLocation ?? const LatLng(0, 0),
            destinationAddress: bookingData?.destinationAddress ?? '',
            passengerCount: count,
            dateTime: bookingData?.dateTime ?? DateTime.now(),
          ),
        ),
      ),
    );
  }

  void updateDateTime(DateTime dateTime) {
    final booking = state.currentBooking;
    final bookingData = state.currentBooking.data;
    emit(
      state.copyWith(
        currentBooking: booking.copyWith(
          data: Booking(
            pickupLocation: bookingData?.pickupLocation ?? const LatLng(0, 0),
            pickupAddress: bookingData?.pickupAddress ?? '',
            destinationLocation: bookingData?.destinationLocation ?? const LatLng(0, 0),
            destinationAddress: bookingData?.destinationAddress ?? '',
            passengerCount: bookingData?.passengerCount ?? 1,
            dateTime: dateTime,
          ),
        ),
      ),
    );
  }

  Future<void> submitBooking() async {
    final booking = state.currentBooking.data;
    if (booking == null) return;

    emit(state.copyWith(currentBooking: AsyncState.loading()));
    try {
      await _repository.addBooking(booking);
      // Emit success with null data to signal completion
      emit(state.copyWith(currentBooking: AsyncState.success(null)));
    } catch (e) {
      emit(state.copyWith(currentBooking: AsyncState.failure(Failure.general(e.toString()))));
    }
  }
}
