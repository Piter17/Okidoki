// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_chat_message_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateChatMessageRequestCWProxy {
  UpdateChatMessageRequest content(String content);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateChatMessageRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateChatMessageRequest call({String content});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateChatMessageRequest.copyWith(...)` or call `instanceOfUpdateChatMessageRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateChatMessageRequestCWProxyImpl
    implements _$UpdateChatMessageRequestCWProxy {
  const _$UpdateChatMessageRequestCWProxyImpl(this._value);

  final UpdateChatMessageRequest _value;

  @override
  UpdateChatMessageRequest content(String content) => call(content: content);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateChatMessageRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateChatMessageRequest call({
    Object? content = const $CopyWithPlaceholder(),
  }) {
    return UpdateChatMessageRequest(
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String,
    );
  }
}

extension $UpdateChatMessageRequestCopyWith on UpdateChatMessageRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateChatMessageRequest.copyWith(...)` or `instanceOfUpdateChatMessageRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateChatMessageRequestCWProxy get copyWith =>
      _$UpdateChatMessageRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateChatMessageRequest _$UpdateChatMessageRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateChatMessageRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['content']);
  final val = UpdateChatMessageRequest(
    content: $checkedConvert('content', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$UpdateChatMessageRequestToJson(
  UpdateChatMessageRequest instance,
) => <String, dynamic>{'content': instance.content};
