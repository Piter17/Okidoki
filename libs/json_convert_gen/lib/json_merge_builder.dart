import 'package:build/build.dart';
import 'package:glob/glob.dart';

import 'json_decoder_options.dart';

class JsonMergeBuilder implements Builder {
  JsonMergeBuilder(this.options);

  final JsonDecoderOptions options;

  @override
  Map<String, List<String>> get buildExtensions => {
    r'$package$': [options.output],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final fragments = <AssetId>[];

    await for (final asset in buildStep.findAssets(
      Glob('**/*${options.fragment}'),
    )) {
      fragments.add(asset);
    }

    final imports = <String>{};
    final entries = <String>[];

    for (final fragment in fragments) {
      final content = await buildStep.readAsString(fragment);

      for (final line in content.split('\n')) {
        if (line.startsWith('import')) {
          imports.add(line);
        }
        if (line.startsWith('const \$jsonDecoder_')) {
          final factory = line.split('\"')[1].split('\"')[0];
          entries.add('    $factory,');
        }
      }
    }

    const decoder = "typedef Decoder = Object Function(Map<String, dynamic>);";

    final buffer = StringBuffer()
      ..writeln('// GENERATED CODE - DO NOT MODIFY BY HAND')
      ..writeAll(
        imports.isEmpty ? ["$decoder\n\n"] : [...imports, '\n$decoder\n\n'],
        "\n",
      )
      ..writeln('class ${options.className} {')
      ..writeln('  static T fromJson<T>(Map<String, dynamic> json) {')
      ..writeln('    final factory = _factories[T];')
      ..writeln(
        "    if (factory == null) throw StateError('No JSON factory registered for type T.');",
      )
      ..writeln('    return factory(json) as T;')
      ..writeln('  }')
      ..writeln()
      ..writeln('  static T? tryFromJson<T>(Map<String, dynamic> json) {')
      ..writeln('    final factory = _factories[T];')
      ..writeln('    return factory == null ? null : factory(json) as T;')
      ..writeln('  }')
      ..writeln()
      ..writeln('  static final Map<Type, Decoder> _factories = {')
      ..writeAll(entries.isEmpty ? [] : [entries.join('\n'), '\n'])
      ..writeln('  };')
      ..writeln('}');

    final output = AssetId(buildStep.inputId.package, options.output);
    await buildStep.writeAsString(output, buffer.toString());
  }
}
