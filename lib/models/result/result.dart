import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  // 成功・失敗の状態のResultオブジェクトを作成する
  const factory Result.success(T value) = Success<T>;
  const factory Result.failure() = Failure<T>;
}
