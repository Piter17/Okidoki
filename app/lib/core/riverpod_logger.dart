import 'package:riv/presentation/presentation.dart';

final class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    debugPrint('''
{
  "provider": "${context.provider}",
  "newValue": "$newValue",
  "mutation": "${context.mutation}"
}''');
  }
}
