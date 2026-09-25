import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';

@RoutePage()
class GuildPage extends StatelessWidget {
  const GuildPage({super.key, @PathParam() required this.guildId});

  final String guildId;

  @override
  Widget build(BuildContext context) => const EmptyPage();
}
