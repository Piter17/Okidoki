import 'package:flutter/material.dart' show ThemeData, ThemeMode;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:okidoki/core/core.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);
    return MaterialApp.router(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      onGenerateTitle: (context) => context.s.app_title,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Language.supportedLocales,
      locale: settings.language.locale,
      routerConfig: ref
          .read(appRouterProvider)
          .config(
            // navigatorObservers: () => [
            //   ref.read(appRouterObserverProvider),
            // ],
          ),
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
