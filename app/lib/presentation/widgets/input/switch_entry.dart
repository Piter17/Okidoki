import 'package:riv/presentation/presentation.dart';

class SwitchEntry extends StatelessWidget {
  final Widget text;
  final Widget? subText;
  final bool value;
  final void Function(bool)? onChanged;

  const new({
    super.key,
    required this.text,
    required this.value,
    this.subText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Entry(
      text: text,
      onTap: onChanged == null ? null : () => onChanged!(!value),
      subText: subText,
      child: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
