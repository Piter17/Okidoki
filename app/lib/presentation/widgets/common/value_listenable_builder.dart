import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' as w show ValueListenableBuilder;
import 'package:riv/presentation/presentation.dart';

class ValueListenableBuilder<T> extends StatelessWidget {
  const new({
    super.key,
    required ValueListenable<T> this.valueListenable,
    required this.builder,
    this.child,
  }) : acceptNull = false,
       defaultValue = null;

  const new maybe({
    super.key,
    required this.valueListenable,
    required this.builder,
    required T this.defaultValue,
    this.child,
  }) : acceptNull = true;

  final bool acceptNull;

  /// The [ValueListenable] whose value you depend on in order to build.
  ///
  /// This widget does not ensure that the [ValueListenable]'s value is not
  /// null, therefore your [builder] may need to handle null values.
  final ValueListenable<T>? valueListenable;

  /// A [ValueWidgetBuilder] which builds a widget depending on the
  /// [valueListenable]'s value.
  ///
  /// Can incorporate a [valueListenable] value-independent widget subtree
  /// from the [child] parameter into the returned widget tree.
  final ValueWidgetBuilder<T> builder;

  /// A [valueListenable]-independent widget which is passed back to the [builder].
  ///
  /// This argument is optional and can be null if the entire widget subtree the
  /// [builder] builds depends on the value of the [valueListenable]. For
  /// example, in the case where the [valueListenable] is a [String] and the
  /// [builder] returns a [Text] widget with the current [String] value, there
  /// would be no useful [child].
  final Widget? child;

  final T? defaultValue;

  @override
  Widget build(BuildContext context) {
    return acceptNull
        ? builder(context, defaultValue as dynamic, child)
        : w.ValueListenableBuilder(
            valueListenable: valueListenable!,
            builder: builder,
            child: child,
          );
  }
}
