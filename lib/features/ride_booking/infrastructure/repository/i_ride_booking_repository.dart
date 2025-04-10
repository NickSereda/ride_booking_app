import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_booking_app/features/ride_booking/domain/booking.dart';

abstract class IRideBookingRepository {
  Future<void> addBooking(Booking booking);
  Future<String> getAddressFromLatLng(LatLng location);
  Stream<List<Booking>> getBookings();
}
