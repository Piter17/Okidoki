import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';

class InsertNewLineAction extends CallbackAction<InsertNewlineIntent> {
  final TextEditingController _inputController;
  new(this._inputController) : super(onInvoke: (_) => null);

  @override
  Object? Function(InsertNewlineIntent intent) get onInvoke => (intent) {
    final selection = _inputController.selection;
    final text = _inputController.text;

    final start = selection.start;
    final end = selection.end;

    // Insert '\n' at the cursor (replace selection if any)
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
