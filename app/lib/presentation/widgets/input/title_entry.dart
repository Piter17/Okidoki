import 'package:riv/presentation/presentation.dart';

class const TitleEntry(
  final Widget title, {
  final Widget? child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Entry(
      text: DefaultTextStyle.merge(
        style: context.fonts.title1,
        child: title,
      ),
      enabled: false,
      child: child ?? SizedBox.shrink(),
    );
  }
}
