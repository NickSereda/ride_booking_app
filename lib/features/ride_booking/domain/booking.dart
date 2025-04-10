import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'booking.freezed.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required LatLng pickupLocation,
    required String pickupAddress,
    required LatLng destinationLocation,
    required String destinationAddress,
    required int passengerCount,
    required DateTime dateTime,
  }) = _Booking;

}
