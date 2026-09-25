//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum UserOnlineState {
  @JsonValue(r'Offline')
  offline(r'Offline'),
  @JsonValue(r'Dnd')
  dnd(r'Dnd'),
  @JsonValue(r'Away')
  away(r'Away'),
  @JsonValue(r'Online')
  online(r'Online');

  const UserOnlineState(this.value);

  final String value;

  @override
  String toString() => value;
}
