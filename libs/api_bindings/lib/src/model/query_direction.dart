//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum QueryDirection {
  @JsonValue(r'Prev')
  prev(r'Prev'),
  @JsonValue(r'Next')
  next(r'Next'),
  @JsonValue(r'Random')
  random(r'Random');

  const QueryDirection(this.value);

  final String value;

  @override
  String toString() => value;
}
