import 'package:ride_booking_app/features/ride_booking/domain/booking.dart';

abstract class IRideBookingRepository {
  Future<void> addBooking(Booking booking);

  Stream<List<Booking>> getBookings();
}
