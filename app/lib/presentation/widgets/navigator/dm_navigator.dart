import 'package:riv/presentation/presentation.dart';

class const DmNavigator({super.key}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SideNavigatorBase(
      top: Button(
        buttonType: .primary,
        onPressed: () {},
        child: Text(context.s.friends_title),
      ),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, idx) => DmEntry(),
      ),
    );
  }
}

class DmEntry extends StatelessWidget {
  const DmEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(context.s.dm_empty);
  }
}
