import 'package:riv/presentation/presentation.dart';

extension FormFieldStateX on FormFieldState {
  bool get isDirty => value != widget.initialValue;
}
