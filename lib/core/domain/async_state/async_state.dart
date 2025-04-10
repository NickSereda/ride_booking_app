import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ride_booking_app/core/domain/failure/failure.dart';

part 'async_state.freezed.dart';

/// A class that is a generic representation of an asynchronous state. It is used in Cubits to manage the state of asynchronous operations.
@freezed
class AsyncState<T> with _$AsyncState<T> {
  const AsyncState._();

  const factory AsyncState({required AsyncStatus status, T? data, Failure? failure}) =
      _AsyncState<T>;

  /// Creates an [AsyncState] with an initial status.
  factory AsyncState.initial() => AsyncState<T>(status: const AsyncStatus.initial());

  /// Creates an [AsyncState] with a loading status.
  factory AsyncState.loading() => AsyncState<T>(status: const AsyncStatus.loading());

  /// Creates an [AsyncState] with a success status and the given data.
  factory AsyncState.success(T data) =>
      AsyncState<T>(status: const AsyncStatus.success(), data: data);

  /// Creates an [AsyncState] with a failure status and the given failure.
  factory AsyncState.failure(Failure failure) =>
      AsyncState<T>(status: const AsyncStatus.failure(), failure: failure);
}

/// An enum that represents the status of an asynchronous operation.
@freezed
class AsyncStatus with _$AsyncStatus {
  const AsyncStatus._();

  const factory AsyncStatus.initial() = InitialStatus;

  const factory AsyncStatus.loading() = LoadingStatus;

  const factory AsyncStatus.success() = SuccessStatus;

  const factory AsyncStatus.failure() = FailureStatus;
}
