// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_message_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateChatMessageRequestCWProxy {
  CreateChatMessageRequest content(String content);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateChatMessageRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateChatMessageRequest call({String content});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateChatMessageRequest.copyWith(...)` or call `instanceOfCreateChatMessageRequest.copyWith.fieldName(value)` for a single field.
class _$CreateChatMessageRequestCWProxyImpl
    implements _$CreateChatMessageRequestCWProxy {
  const _$CreateChatMessageRequestCWProxyImpl(this._value);

  final CreateChatMessageRequest _value;

  @override
  CreateChatMessageRequest content(String content) => call(content: content);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateChatMessageRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateChatMessageRequest call({
    Object? content = const $CopyWithPlaceholder(),
  }) {
    return CreateChatMessageRequest(
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String,
    );
  }
}

extension $CreateChatMessageRequestCopyWith on CreateChatMessageRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateChatMessageRequest.copyWith(...)` or `instanceOfCreateChatMessageRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateChatMessageRequestCWProxy get copyWith =>
      _$CreateChatMessageRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatMessageRequest _$CreateChatMessageRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateChatMessageRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['content']);
  final val = CreateChatMessageRequest(
    content: $checkedConvert('content', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$CreateChatMessageRequestToJson(
  CreateChatMessageRequest instance,
) => <String, dynamic>{'content': instance.content};
