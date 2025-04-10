import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_booking_app/core/domain/async_state/async_state.dart';
import 'package:ride_booking_app/core/domain/failure/failure.dart';
import 'package:ride_booking_app/features/ride_booking/domain/booking.dart';
import 'package:ride_booking_app/features/ride_booking/infrastructure/repository/i_ride_booking_repository.dart';
import 'package:rxdart/rxdart.dart';

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

  void updatePickupLocation(LatLng location, String address) {
    emit(
      state.copyWith(
        currentBooking: AsyncState.success(
          Booking(
            pickupLocation: location,
            pickupAddress: address,
            destinationLocation:
                state.currentBooking.data?.destinationLocation ?? const LatLng(0, 0),
            destinationAddress: state.currentBooking.data?.destinationAddress ?? '',
            passengerCount: state.currentBooking.data?.passengerCount ?? 1,
            dateTime: state.currentBooking.data?.dateTime ?? DateTime.now(),
          ),
        ),
      ),
    );
  }

  void updateDestinationLocation(LatLng location, String address) {
    emit(
      state.copyWith(
        currentBooking: AsyncState.success(
          Booking(
            pickupLocation: state.currentBooking.data?.pickupLocation ?? const LatLng(0, 0),
            pickupAddress: state.currentBooking.data?.pickupAddress ?? '',
            destinationLocation: location,
            destinationAddress: address,
            passengerCount: state.currentBooking.data?.passengerCount ?? 1,
            dateTime: state.currentBooking.data?.dateTime ?? DateTime.now(),
          ),
        ),
      ),
    );
  }

  void updatePassengerCount(int count) {
    emit(
      state.copyWith(
        currentBooking: AsyncState.success(
          Booking(
            pickupLocation: state.currentBooking.data?.pickupLocation ?? const LatLng(0, 0),
            pickupAddress: state.currentBooking.data?.pickupAddress ?? '',
            destinationLocation:
                state.currentBooking.data?.destinationLocation ?? const LatLng(0, 0),
            destinationAddress: state.currentBooking.data?.destinationAddress ?? '',
            passengerCount: count,
            dateTime: state.currentBooking.data?.dateTime ?? DateTime.now(),
          ),
        ),
      ),
    );
  }

  void updateDateTime(DateTime dateTime) {
    emit(
      state.copyWith(
        currentBooking: AsyncState.success(
          Booking(
            pickupLocation: state.currentBooking.data?.pickupLocation ?? const LatLng(0, 0),
            pickupAddress: state.currentBooking.data?.pickupAddress ?? '',
            destinationLocation:
                state.currentBooking.data?.destinationLocation ?? const LatLng(0, 0),
            destinationAddress: state.currentBooking.data?.destinationAddress ?? '',
            passengerCount: state.currentBooking.data?.passengerCount ?? 1,
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
      emit(state.copyWith(currentBooking: AsyncState.initial()));
    } catch (e) {
      emit(state.copyWith(currentBooking: AsyncState.failure(Failure.general(e.toString()))));
    }
  }
}
