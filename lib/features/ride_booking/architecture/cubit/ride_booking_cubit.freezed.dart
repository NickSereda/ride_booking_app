// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RideBookingState {
  AsyncState<Booking?> get currentBooking => throw _privateConstructorUsedError;
  AsyncState<List<Booking>> get bookings => throw _privateConstructorUsedError;

  /// Create a copy of RideBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RideBookingStateCopyWith<RideBookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideBookingStateCopyWith<$Res> {
  factory $RideBookingStateCopyWith(
    RideBookingState value,
    $Res Function(RideBookingState) then,
  ) = _$RideBookingStateCopyWithImpl<$Res, RideBookingState>;
  @useResult
  $Res call({
    AsyncState<Booking?> currentBooking,
    AsyncState<List<Booking>> bookings,
  });

  $AsyncStateCopyWith<Booking?, $Res> get currentBooking;
  $AsyncStateCopyWith<List<Booking>, $Res> get bookings;
}

/// @nodoc
class _$RideBookingStateCopyWithImpl<$Res, $Val extends RideBookingState>
    implements $RideBookingStateCopyWith<$Res> {
  _$RideBookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RideBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentBooking = null, Object? bookings = null}) {
    return _then(
      _value.copyWith(
            currentBooking:
                null == currentBooking
                    ? _value.currentBooking
                    : currentBooking // ignore: cast_nullable_to_non_nullable
                        as AsyncState<Booking?>,
            bookings:
                null == bookings
                    ? _value.bookings
                    : bookings // ignore: cast_nullable_to_non_nullable
                        as AsyncState<List<Booking>>,
          )
          as $Val,
    );
  }

  /// Create a copy of RideBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<Booking?, $Res> get currentBooking {
    return $AsyncStateCopyWith<Booking?, $Res>(_value.currentBooking, (value) {
      return _then(_value.copyWith(currentBooking: value) as $Val);
    });
  }

  /// Create a copy of RideBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<Booking>, $Res> get bookings {
    return $AsyncStateCopyWith<List<Booking>, $Res>(_value.bookings, (value) {
      return _then(_value.copyWith(bookings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RideBookingStateImplCopyWith<$Res>
    implements $RideBookingStateCopyWith<$Res> {
  factory _$$RideBookingStateImplCopyWith(
    _$RideBookingStateImpl value,
    $Res Function(_$RideBookingStateImpl) then,
  ) = __$$RideBookingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AsyncState<Booking?> currentBooking,
    AsyncState<List<Booking>> bookings,
  });

  @override
  $AsyncStateCopyWith<Booking?, $Res> get currentBooking;
  @override
  $AsyncStateCopyWith<List<Booking>, $Res> get bookings;
}

/// @nodoc
class __$$RideBookingStateImplCopyWithImpl<$Res>
    extends _$RideBookingStateCopyWithImpl<$Res, _$RideBookingStateImpl>
    implements _$$RideBookingStateImplCopyWith<$Res> {
  __$$RideBookingStateImplCopyWithImpl(
    _$RideBookingStateImpl _value,
    $Res Function(_$RideBookingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RideBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentBooking = null, Object? bookings = null}) {
    return _then(
      _$RideBookingStateImpl(
        currentBooking:
            null == currentBooking
                ? _value.currentBooking
                : currentBooking // ignore: cast_nullable_to_non_nullable
                    as AsyncState<Booking?>,
        bookings:
            null == bookings
                ? _value.bookings
                : bookings // ignore: cast_nullable_to_non_nullable
                    as AsyncState<List<Booking>>,
      ),
    );
  }
}

/// @nodoc

class _$RideBookingStateImpl implements _RideBookingState {
  const _$RideBookingStateImpl({
    required this.currentBooking,
    required this.bookings,
  });

  @override
  final AsyncState<Booking?> currentBooking;
  @override
  final AsyncState<List<Booking>> bookings;

  @override
  String toString() {
    return 'RideBookingState(currentBooking: $currentBooking, bookings: $bookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideBookingStateImpl &&
            (identical(other.currentBooking, currentBooking) ||
                other.currentBooking == currentBooking) &&
            (identical(other.bookings, bookings) ||
                other.bookings == bookings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentBooking, bookings);

  /// Create a copy of RideBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RideBookingStateImplCopyWith<_$RideBookingStateImpl> get copyWith =>
      __$$RideBookingStateImplCopyWithImpl<_$RideBookingStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RideBookingState implements RideBookingState {
  const factory _RideBookingState({
    required final AsyncState<Booking?> currentBooking,
    required final AsyncState<List<Booking>> bookings,
  }) = _$RideBookingStateImpl;

  @override
  AsyncState<Booking?> get currentBooking;
  @override
  AsyncState<List<Booking>> get bookings;

  /// Create a copy of RideBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RideBookingStateImplCopyWith<_$RideBookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
