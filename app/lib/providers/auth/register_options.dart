import 'package:okidoki/domain/domain.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_options.g.dart';

@riverpod
Future<RegisterOptions> registerOptions(Ref ref) => ref
    .cacheFor(const Duration(days: 1))
    .callUnauthApi(
      (f, _) => f.getAuthApi().getRegisterOptions(),
    )
    .then(RegisterOptions.fromDto);
