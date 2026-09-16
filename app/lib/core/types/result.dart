import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T, E> with _$Result {
  const factory Result.success(T result) = SuccessResult<T, E>;
  const factory Result.error(E error) = ErrorResult<T, E>;
}

extension ResultX<T, E> on Result<T, E> {
  R fold<R>(
    R Function(T result) onSuccess,
    R Function(E error) onError,
  ) {
    return switch (this) {
      SuccessResult(result: final result) => onSuccess(result),
      ErrorResult(error: final error) => onError(error),
    };
  }
}
