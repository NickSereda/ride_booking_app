import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Failure class to handle errors in the application.
@freezed
class Failure with _$Failure {
  const factory Failure.network(String message) = _NetworkFailure;
  const factory Failure.general(String message) = _GeneralFailure;
}
