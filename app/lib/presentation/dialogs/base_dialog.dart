import 'package:okidoki/presentation/presentation.dart';

class const BaseDialog({
  super.key,
  required final Widget child,
  final bool dismissible = true,
  final bool centerText = true,
  final String? title,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        DialogHeader(
          text: title ?? "",
          centerText: centerText,
          showCloseButton: dismissible,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: context.values.containerPaddingXL.except(
              top: true,
            ),
            child: Align(
              alignment: .topStart,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
