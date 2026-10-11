import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_titlebar/flutter_titlebar.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:logging/logging.dart';
import 'package:okidoki/app.dart';
import 'package:okidoki/core/core.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart' hide HttpClient;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_devtools/riverpod_devtools.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_db_inspector/sqflite_db_inspector.dart';

Future loadRiverpodDependencyData() async {
  try {
    final jsonString = await rootBundle.loadString(
      'lib/riverpod_dependencies.json',
    );
    RiverpodDevToolsRegistry.instance.loadFromJson(jsonString);
  } catch (e) {
    debugPrint('riverpod_devtools: could not load dependency data: $e');
  }
}

void main(List args) async {
  ScaledWidgetsFlutterBinding.ensureInitialized();
  if (!kReleaseMode) {
    debugProfileBuildsEnabled = true;
    registerSqliteInspector(() async => openDatabase(await getDbPath()));
  }
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // if (record.loggerName.contains("SignalR")) return;
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });

  await BackLongPressBus.init();
  await FlutterTitlebar.addButtons();

  final version = await PackageInfo.fromPlatform();
  final globalSettings = await SharedPreferences.getInstance();

  usePathUrlStrategy();

  runApp(
    ProviderScope(
      retry: riverpodRetryPolicy,
      overrides: [
        globalPreferencesProvider.overrideWithValue(globalSettings),
        userPreferencesProvider.overrideWithValue(globalSettings),
        appVersionProvider.overrideWithValue(version),
      ],
      observers: [
        RiverpodDevToolsObserver(),
        RiverpodLogger(),
      ],
      child: App(),
    ),
  );
}
