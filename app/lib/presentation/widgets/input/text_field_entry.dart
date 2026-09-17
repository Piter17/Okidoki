import 'package:riv/presentation/presentation.dart';

class const TextEntry({
  super.key,
  required this.text,
  required this.value,
  this.subText,
  this.onSubmitted,
}) extends HookWidget {
  final Widget text;
  final Widget? subText;
  final String value;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: value);
    return Entry(
      text: text,
      // onTap: onChanged == null ? null : () => onChanged!(!value),
      subText: subText,
      child: Expanded(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(),
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}

class const TextFormEntry({
  super.key,
  required final Widget text,
  required final String value,
  required final GlobalKey fieldKey,
  final void Function(String? value)? onSaved,
  final Widget? subText,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Entry(
      text: text,
      // onTap: onChanged == null ? null : () => onChanged!(!value),
      subText: subText,
      child: Expanded(
        child: TextFormField(
          key: fieldKey,
          initialValue: value,
          onSaved: onSaved,
          decoration: InputDecoration(),
        ),
      ),
    );
  }
}
