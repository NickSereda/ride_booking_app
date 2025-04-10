import 'package:injectable/injectable.dart';
import 'package:ride_booking_app/features/ride_booking/domain/booking.dart';
import 'package:ride_booking_app/features/ride_booking/infrastructure/repository/i_ride_booking_repository.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: IRideBookingRepository, env: [Environment.dev])
class DevRideBookingRepository implements IRideBookingRepository {
  final _bookingsController = BehaviorSubject<List<Booking>>.seeded([]);

  @override
  Future<void> addBooking(Booking booking) async {
    final currentBookings = _bookingsController.value;
    _bookingsController.add([...currentBookings, booking]);
  }

  @override
  Stream<List<Booking>> getBookings() => _bookingsController.stream;
}
