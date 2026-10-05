import 'package:okidoki/presentation/presentation.dart';

class const ButtonEntry({
  super.key,
  required final Widget text,
  final String? buttonText,
  final Widget? subText,
  required final VoidCallback? onTapped,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Entry(
      text: text,
      onTap: onTapped,
      subText: subText,
      child: buttonText == null
          ? SizedBox.shrink()
          : Button(
              onPressed: onTapped,
              child: Text(buttonText!),
            ),
    );
  }
}
