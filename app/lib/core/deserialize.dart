import 'package:api_bindings/json.dart';
import 'package:riv/core/exceptions/deserialize_exception.dart';
import 'package:riv/core/types/result.dart';

T deserialize<T>(dynamic value, [String? targetType]) =>
    JsonConverter.fromJson(value);

Result<T, DeserializeException> tryDeserialize<T>(dynamic value) {
  try {
    return .success(JsonConverter.fromJson(value));
  } catch (e, st) {
    return .error(DeserializeException(e, st));
  }
}
