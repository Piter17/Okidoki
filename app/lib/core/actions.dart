import 'package:okidoki/core/core.dart';
import 'package:okidoki/presentation/presentation.dart';

class InsertNewLineAction extends CallbackAction<InsertNewlineIntent> {
  final TextEditingController _inputController;
  new(this._inputController) : super(onInvoke: (_) => null);

  @override
  Object? Function(InsertNewlineIntent intent) get onInvoke => (intent) {
    final selection = _inputController.selection;
    final text = _inputController.text;

    final start = selection.start;
    final end = selection.end;

    final newText = text.replaceRange(start, end, '\n');

    final newCursor = start + 1;
    _inputController.value = _inputController.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newCursor),
      composing: TextRange.empty,
    );

    return null;
  };
}
