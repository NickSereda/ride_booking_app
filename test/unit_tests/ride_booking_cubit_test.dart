import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ride_booking_app/core/domain/async_state/async_state.dart';
import 'package:ride_booking_app/core/domain/failure/failure.dart';
import 'package:ride_booking_app/features/ride_booking/architecture/cubit/ride_booking_cubit.dart';
import 'package:ride_booking_app/features/ride_booking/domain/booking.dart';
import 'package:ride_booking_app/features/ride_booking/infrastructure/repository/i_ride_booking_repository.dart';

class MockRideBookingRepository extends Mock implements IRideBookingRepository {}

void main() {
  late MockRideBookingRepository mockRideBookingRepository;

  final fakeBookings = [
    Booking(
      pickupLocation: const LatLng(40.7128, -74.0060),
      pickupAddress: 'New York, NY',
      destinationLocation: const LatLng(34.0522, -118.2437),
      destinationAddress: 'Los Angeles, CA',
      passengerCount: 2,
      dateTime: DateTime(2025, 4, 11),
    ),
  ];

  const testLatLng = LatLng(51.5074, -0.1278);
  const testAddress = 'London, UK';
  final testDateTime = DateTime(2025, 4, 12);

  setUp(() {
    mockRideBookingRepository = MockRideBookingRepository();
    when(() => mockRideBookingRepository.getBookings())
        .thenAnswer((_) => Stream.value(fakeBookings));
    when(() => mockRideBookingRepository.getAddressFromLatLng(testLatLng))
        .thenAnswer((_) async => testAddress);
    when(() => mockRideBookingRepository.addBooking(fakeBookings.first))
        .thenAnswer((_) async => Future.value());
  });

  group('RideBookingCubit Tests', () {
    blocTest<RideBookingCubit, RideBookingState>(
      'Initial state is correct',
      build: () => RideBookingCubit(mockRideBookingRepository),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
    );

    blocTest<RideBookingCubit, RideBookingState>(
      'Bookings subscription updates state',
      build: () => RideBookingCubit(mockRideBookingRepository),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
    );

    blocTest<RideBookingCubit, RideBookingState>(
      'updatePickupLocation emits updated booking state',
      build: () => RideBookingCubit(mockRideBookingRepository),
      act: (cubit) async => await cubit.updatePickupLocation(testLatLng),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.currentBooking.data?.pickupLocation,
          'currentBooking.data.pickupLocation',
          testLatLng,
        )
            .having(
              (s) => s.currentBooking.data?.pickupAddress,
          'currentBooking.data.pickupAddress',
          testAddress,
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
      verify: (_) {
        verify(() => mockRideBookingRepository.getAddressFromLatLng(testLatLng)).called(1);
      },
    );

    blocTest<RideBookingCubit, RideBookingState>(
      'updatePickupLocation emits failure state when repository fails',
      build: () {
        when(() => mockRideBookingRepository.getAddressFromLatLng(testLatLng))
            .thenThrow(Exception('Geocoding error'));
        return RideBookingCubit(mockRideBookingRepository);
      },
      act: (cubit) async => await cubit.updatePickupLocation(testLatLng),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.failure(),
        )
            .having(
              (s) => s.currentBooking.failure,
          'currentBooking.failure',
          Failure.general('Exception: Geocoding error'),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.initial(),
        ),
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.failure(),
        )
            .having(
              (s) => s.currentBooking.failure,
          'currentBooking.failure',
          Failure.general('Exception: Geocoding error'),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
    );

    blocTest<RideBookingCubit, RideBookingState>(
      'updateDestinationLocation emits updated booking state',
      build: () => RideBookingCubit(mockRideBookingRepository),
      act: (cubit) async => await cubit.updateDestinationLocation(testLatLng),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.currentBooking.data?.destinationLocation,
          'currentBooking.data.destinationLocation',
          testLatLng,
        )
            .having(
              (s) => s.currentBooking.data?.destinationAddress,
          'currentBooking.data.destinationAddress',
          testAddress,
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
      verify: (_) {
        verify(() => mockRideBookingRepository.getAddressFromLatLng(testLatLng)).called(1);
      },
    );

    blocTest<RideBookingCubit, RideBookingState>(
      'updatePassengerCount emits updated booking state',
      build: () => RideBookingCubit(mockRideBookingRepository),
      act: (cubit) => cubit.updatePassengerCount(3),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.currentBooking.data?.passengerCount,
          'currentBooking.data.passengerCount',
          3,
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.initial(),
        ),
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.currentBooking.data?.passengerCount,
          'currentBooking.data.passengerCount',
          3,
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
    );

    blocTest<RideBookingCubit, RideBookingState>(
      'updateDateTime emits updated booking state',
      build: () => RideBookingCubit(mockRideBookingRepository),
      act: (cubit) => cubit.updateDateTime(testDateTime),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.currentBooking.data?.dateTime,
          'currentBooking.data.dateTime',
          testDateTime,
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.initial(),
        ),
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.currentBooking.data?.dateTime,
          'currentBooking.data.dateTime',
          testDateTime,
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
    );

    blocTest<RideBookingCubit, RideBookingState>(
      'submitBooking emits loading and success states',
      build: () => RideBookingCubit(mockRideBookingRepository),
      seed: () => RideBookingState.initial().copyWith(
        currentBooking: AsyncState<Booking?>.success(fakeBookings.first),
        bookings: AsyncState.success(fakeBookings),
      ),
      act: (cubit) async => await cubit.submitBooking(),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.loading(),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.currentBooking.data,
          'currentBooking.data',
          null,
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
      verify: (_) {
        verify(() => mockRideBookingRepository.addBooking(fakeBookings.first)).called(1);
      },
    );

    blocTest<RideBookingCubit, RideBookingState>(
      'submitBooking emits loading and failure states when repository fails',
      build: () {
        when(() => mockRideBookingRepository.addBooking(fakeBookings.first))
            .thenThrow(Exception('Booking error'));
        return RideBookingCubit(mockRideBookingRepository);
      },
      seed: () => RideBookingState.initial().copyWith(
        currentBooking: AsyncState<Booking?>.success(fakeBookings.first),
        bookings: AsyncState.success(fakeBookings),
      ),
      act: (cubit) async => await cubit.submitBooking(),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.loading(),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.failure(),
        )
            .having(
              (s) => s.currentBooking.failure,
          'currentBooking.failure',
          Failure.general('Exception: Booking error'),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
      verify: (_) {
        verify(() => mockRideBookingRepository.addBooking(fakeBookings.first)).called(1);
      },
    );

    blocTest<RideBookingCubit, RideBookingState>(
      'submitBooking does nothing when currentBooking.data is null',
      build: () => RideBookingCubit(mockRideBookingRepository),
      act: (cubit) => cubit.submitBooking(),
      expect: () => [
        isA<RideBookingState>()
            .having(
              (s) => s.currentBooking.status,
          'currentBooking.status',
          const AsyncStatus.initial(),
        )
            .having(
              (s) => s.bookings.status,
          'bookings.status',
          const AsyncStatus.success(),
        )
            .having(
              (s) => s.bookings.data,
          'bookings.data',
          fakeBookings,
        ),
      ],
    );
  });
}