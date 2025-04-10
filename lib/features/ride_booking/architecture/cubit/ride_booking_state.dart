
part of 'ride_booking_cubit.dart';

@freezed
class RideBookingState with _$RideBookingState {
  const factory RideBookingState({
    required AsyncState<Booking?> currentBooking,
    required AsyncState<List<Booking>> bookings,
  }) = _RideBookingState;

  factory RideBookingState.initial() => RideBookingState(
    currentBooking: AsyncState.initial(),
    bookings: AsyncState.initial(),
  );
}