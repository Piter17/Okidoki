import 'package:build/build.dart';

import 'json_decoder_options.dart';
import 'json_fragment_builder.dart';
import 'json_merge_builder.dart';

Builder jsonFragmentBuilder(BuilderOptions options) {
  return JsonFragmentBuilder(JsonDecoderOptions.from(options));
}

Builder jsonMergeBuilder(BuilderOptions options) {
  return JsonMergeBuilder(JsonDecoderOptions.from(options));
}
