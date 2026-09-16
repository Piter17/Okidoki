// ignore: implementation_imports
import 'package:api_bindings/src/deserialize.dart' as api;
import 'package:riv/core/exceptions/deserialize_exception.dart';
import 'package:riv/core/types/result.dart';

T deserialize<T>(dynamic value, [String? targetType]) =>
    api.deserialize<T, T>(value, targetType ?? T.toString());

Result<T, DeserializeException> tryDeserialize<T>(dynamic value) {
  try {
    return .success(api.deserialize(value, T.toString()));
  } catch (e, st) {
    return .error(DeserializeException(e, st));
  }
}
