import 'package:riv/presentation/presentation.dart';

class const Section({
  required final Widget header,
  required final Widget body,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        DefaultTextStyle.merge(
          style: context.fonts.title1,
          child: header,
        ),
        Space(),
        body,
      ],
    );
  }
}
