import 'package:moviesapp/network/APIError.dart';

enum ResultType { success, error }

class Result<T> {
  Result([this.result, this.value, this.errorValue]);

  factory Result.success(T value) => Result(ResultType.success, value);
  factory Result.error(APIError errorValue) =>
      Result(ResultType.error, null, errorValue);

  final ResultType result;
  final T value;
  final APIError errorValue;
}
