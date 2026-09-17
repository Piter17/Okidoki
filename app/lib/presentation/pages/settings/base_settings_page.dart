import 'package:riv/presentation/presentation.dart';

class const BaseSettingsPage({super.key, required final Widget child})
    extends StatelessWidget {
  factory column(List<Widget> children) => BaseSettingsPage(
    child: Builder(
      builder: (context) => Column(
        crossAxisAlignment: .stretch,
        spacing: context.values.spacing,
        children: children,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.values.containerPaddingL,
        child: child,
      ),
    );
  }
}
