import 'package:hooks_riverpod/experimental/persist.dart';
import 'package:riv/core/db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sqflite/riverpod_sqflite.dart';

part 'storage.g.dart';

@riverpod
Future<Storage<String, String>> storage(Ref ref) async {
  // Initialize SQFlite. We should share the Storage instance between providers.
  return JsonSqFliteStorage.open(
    await getDbPath(),
  );
}
