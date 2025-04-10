// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Booking {
  LatLng? get pickupLocation => throw _privateConstructorUsedError;
  String? get pickupAddress => throw _privateConstructorUsedError;
  LatLng? get destinationLocation => throw _privateConstructorUsedError;
  String? get destinationAddress => throw _privateConstructorUsedError;
  int? get passengerCount => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call({
    LatLng? pickupLocation,
    String? pickupAddress,
    LatLng? destinationLocation,
    String? destinationAddress,
    int? passengerCount,
    DateTime? dateTime,
  });
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickupLocation = freezed,
    Object? pickupAddress = freezed,
    Object? destinationLocation = freezed,
    Object? destinationAddress = freezed,
    Object? passengerCount = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            pickupLocation:
                freezed == pickupLocation
                    ? _value.pickupLocation
                    : pickupLocation // ignore: cast_nullable_to_non_nullable
                        as LatLng?,
            pickupAddress:
                freezed == pickupAddress
                    ? _value.pickupAddress
                    : pickupAddress // ignore: cast_nullable_to_non_nullable
                        as String?,
            destinationLocation:
                freezed == destinationLocation
                    ? _value.destinationLocation
                    : destinationLocation // ignore: cast_nullable_to_non_nullable
                        as LatLng?,
            destinationAddress:
                freezed == destinationAddress
                    ? _value.destinationAddress
                    : destinationAddress // ignore: cast_nullable_to_non_nullable
                        as String?,
            passengerCount:
                freezed == passengerCount
                    ? _value.passengerCount
                    : passengerCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            dateTime:
                freezed == dateTime
                    ? _value.dateTime
                    : dateTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
    _$BookingImpl value,
    $Res Function(_$BookingImpl) then,
  ) = __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    LatLng? pickupLocation,
    String? pickupAddress,
    LatLng? destinationLocation,
    String? destinationAddress,
    int? passengerCount,
    DateTime? dateTime,
  });
}

/// @nodoc
class __$$BookingImplCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$BookingImpl>
    implements _$$BookingImplCopyWith<$Res> {
  __$$BookingImplCopyWithImpl(
    _$BookingImpl _value,
    $Res Function(_$BookingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickupLocation = freezed,
    Object? pickupAddress = freezed,
    Object? destinationLocation = freezed,
    Object? destinationAddress = freezed,
    Object? passengerCount = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(
      _$BookingImpl(
        pickupLocation:
            freezed == pickupLocation
                ? _value.pickupLocation
                : pickupLocation // ignore: cast_nullable_to_non_nullable
                    as LatLng?,
        pickupAddress:
            freezed == pickupAddress
                ? _value.pickupAddress
                : pickupAddress // ignore: cast_nullable_to_non_nullable
                    as String?,
        destinationLocation:
            freezed == destinationLocation
                ? _value.destinationLocation
                : destinationLocation // ignore: cast_nullable_to_non_nullable
                    as LatLng?,
        destinationAddress:
            freezed == destinationAddress
                ? _value.destinationAddress
                : destinationAddress // ignore: cast_nullable_to_non_nullable
                    as String?,
        passengerCount:
            freezed == passengerCount
                ? _value.passengerCount
                : passengerCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        dateTime:
            freezed == dateTime
                ? _value.dateTime
                : dateTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$BookingImpl implements _Booking {
  const _$BookingImpl({
    this.pickupLocation,
    this.pickupAddress,
    this.destinationLocation,
    this.destinationAddress,
    this.passengerCount,
    this.dateTime,
  });

  @override
  final LatLng? pickupLocation;
  @override
  final String? pickupAddress;
  @override
  final LatLng? destinationLocation;
  @override
  final String? destinationAddress;
  @override
  final int? passengerCount;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'Booking(pickupLocation: $pickupLocation, pickupAddress: $pickupAddress, destinationLocation: $destinationLocation, destinationAddress: $destinationAddress, passengerCount: $passengerCount, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.destinationLocation, destinationLocation) ||
                other.destinationLocation == destinationLocation) &&
            (identical(other.destinationAddress, destinationAddress) ||
                other.destinationAddress == destinationAddress) &&
            (identical(other.passengerCount, passengerCount) ||
                other.passengerCount == passengerCount) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    pickupLocation,
    pickupAddress,
    destinationLocation,
    destinationAddress,
    passengerCount,
    dateTime,
  );

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      __$$BookingImplCopyWithImpl<_$BookingImpl>(this, _$identity);
}

abstract class _Booking implements Booking {
  const factory _Booking({
    final LatLng? pickupLocation,
    final String? pickupAddress,
    final LatLng? destinationLocation,
    final String? destinationAddress,
    final int? passengerCount,
    final DateTime? dateTime,
  }) = _$BookingImpl;

  @override
  LatLng? get pickupLocation;
  @override
  String? get pickupAddress;
  @override
  LatLng? get destinationLocation;
  @override
  String? get destinationAddress;
  @override
  int? get passengerCount;
  @override
  DateTime? get dateTime;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
