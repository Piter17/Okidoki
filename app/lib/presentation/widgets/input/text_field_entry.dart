import 'package:okidoki/presentation/presentation.dart';

class const TextEntry({
  super.key,
  required final Widget text,
  required final String value,
  final Widget? subText,
  final void Function(String)? onSubmitted,
  final VoidCallback? onTap,
  final bool readOnly = false,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: value);
    return Entry(
      text: text,
      onTap: onTap,
      subText: subText,
      child: Expanded(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(),
          onSubmitted: onSubmitted,
          readOnly: readOnly,
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
