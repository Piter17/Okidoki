import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_titlebar/flutter_titlebar.dart';
import 'package:hooks_riverpod/misc.dart';
import 'package:logging/logging.dart';
import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riverpod_devtools/riverpod_devtools.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_db_inspector/sqflite_db_inspector.dart';
import 'package:riv/providers/providers.dart' hide HttpClient;

const kServerBaseUrl = "https://api.okidoki.fun/";

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

  await FlutterTitlebar.addButtons();
  FlutterTitlebar.backCallback = () => debugPrint('back');
  FlutterTitlebar.continueCallback = () => debugPrint('continue');
  await BackLongPressBus.init();
  FlutterTitlebar.setContinueEnabled(true);

  final globalSettings = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      retry: (retryCount, error) {
        if (retryCount >= 5) return null;
        if (error is ProviderException) return null;
        if (error is DioException) {
          if (error.type == .badResponse) {
            if (error.response?.statusCode != 500) return null;
          }
        }

        return Duration(milliseconds: 200 * (1 << retryCount));
      },
      overrides: [
        globalPreferencesProvider.overrideWithValue(globalSettings),
        userPreferencesProvider.overrideWithValue(globalSettings),
      ],
      observers: [
        RiverpodDevToolsObserver(),
        RiverpodLogger(),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);
    return MaterialApp.router(
      onGenerateTitle: (context) => context.s.app_title,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Language.supportedLocales,
      locale: settings.language.locale,
      routerConfig: ref.read(appRouterProvider).config(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => AppShortcuts(
        child: ScrollZoom(
          child: TickerMode(
            enabled: true,
            child: AuthGate(
              child: child!,
            ),
          ),
        ),
      ),
    );
  }
}
