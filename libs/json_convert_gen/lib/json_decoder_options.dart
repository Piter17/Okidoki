import 'package:build/build.dart';

class const JsonDecoderOptions({
  required final String output,
  required final String className,
  required final String includeDirectory,
  required final String fragment,
}) {
  factory JsonDecoderOptions.from(BuilderOptions options) {
    final output = options.config['output'];
    final className = options.config['class_name'];
    final includeDirectory = options.config['include_directory'];
    final fragment = options.config['fragment'];

    var effectiveOptions = JsonDecoderOptions(
      output: output is String && output.isNotEmpty ? output : 'lib/json.dart',
      className: className is String && className.isNotEmpty
          ? className
          : 'JsonConverter',
      includeDirectory: includeDirectory is String && className.isNotEmpty
          ? output
          : '**/*',
      fragment: fragment is String && fragment.isNotEmpty
          ? fragment
          : '.json_frag.dart',
    );
    print([
      effectiveOptions.className,
      effectiveOptions.output,
      effectiveOptions.includeDirectory,
      effectiveOptions.fragment,
    ]);
    return effectiveOptions;
  }
}
