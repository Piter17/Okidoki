import 'package:build/build.dart';
import 'package:analyzer/dart/element/element.dart';

import 'json_decoder_options.dart';

class JsonFragmentBuilder implements Builder {
  JsonFragmentBuilder(this.options);

  final JsonDecoderOptions options;

  @override
  Map<String, List<String>> get buildExtensions => {
    '.dart': [options.fragment],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final id = buildStep.inputId;

    if (!await buildStep.resolver.isLibrary(id)) return;
    if (id.path.endsWith('.freezed.dart') ||
        id.path.endsWith('.g.dart') ||
        id.path.endsWith(options.fragment))
      return;

    final source = await buildStep.readAsString(id);
    if (!source.contains('@JsonSerializable')) return;

    final lib = await buildStep.resolver.libraryFor(id);
    final buffer = StringBuffer()
      ..writeln('// GENERATED CODE - DO NOT MODIFY BY HAND')
      ..writeln();

    bool wroteAnything = false;

    for (final element in lib.classes) {
      if (_hasJsonSerializable(element)) {
        final name = element.name;
        final uri = element.library.uri.toString();
        if (name == null) continue;

        buffer.writeln("import '$uri';");
        buffer.writeln('const \$jsonDecoder_$name = "$name: $name.fromJson";');
        buffer.writeln();
        wroteAnything = true;
      }
    }

    if (!wroteAnything) return;

    final outputId = id.changeExtension(options.fragment);
    await buildStep.writeAsString(outputId, buffer.toString());
  }

  bool _hasJsonSerializable(ClassElement clazz) {
    if (clazz.name?.startsWith('_') == true) return false;
    for (final annotation in clazz.metadata.annotations) {
      final element = annotation.element;
      if (element is ConstructorElement &&
          element.enclosingElement.name == 'JsonSerializable' &&
          element.library.identifier ==
              'package:json_annotation/src/json_serializable.dart') {
        return true;
      }
    }
    return false;
  }
}
