import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:auto_route/auto_route.dart';

class const GuildList({
  super.key,
}) extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guilds = ref.watch(guildsProvider);
    final current = AutoRouter.of(context, watch: true).currentChild;
    final selectedGuildId = current?.params.optString('guildId');
    final isFriendsSelected = current?.name == FriendsRoute.name;

    // final itemCount = guilds.isLoading ? 10 : guilds.requireValue.length;
    // final items = guilds.isLoading
    //     ? Iterable.generate(10, (_) => GuildIcon.skeleton())
    //     : guilds.requireValue;
    return SizedBox(
      width: 40 + context.values.spacing * 2.5,
      child: SideNavigatorBase(
        top: DMIcon(
          unreadItems: 4,
          isSelected: isFriendsSelected,
        ),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: .symmetric(vertical: 12),
              sliver: SliverList.separated(
                separatorBuilder: (context, index) => Space(space: 12),
                itemCount: guilds.isLoading ? 10 : guilds.requireValue.length,
                itemBuilder: (context, index) => Align(
                  alignment: .centerLeft,
                  child: guilds.isLoading
                      ? GuildIcon.skeleton()
                      : GuildIcon(
                          key: ValueKey(index),
                          guildProfile: guilds.requireValue[index],
                          isSelected:
                              guilds.requireValue[index].id == selectedGuildId,
                        ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AddGuildIcon(),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final guilds = ref.watch(guildsProvider);
  //   final selectedGuildId = ChatHostPage.of(context).guildId;
  //   return SizedBox(
  //     width: 80,
  //     child: ListView.builder(
  //       itemCount: guilds.requireValue.length + 4,
  //       itemBuilder: (context, index) {
  //         if (index == 0)
  //           return DMIcon(
  //             unreadItems: 4,
  //           );
  //         if (index == 1) return Divider();
  //         final idx = index - 2;

  //         final oI = idx - guilds.requireValue.length;
  //         if (oI < 0) {
  //           final x = guilds.requireValue[idx];
  //           return GuildIcon(
  //             guild: x,
  //             isSelected: x.id == selectedGuildId,
  //           );
  //         }
  //         if (oI == 0) return AddGuildIcon();
  //         if (oI == 1) return SizedBox(height: bottomSpace);
  //         return null;
  //       },
  //       // children: [

  //       //   ...guilds.map(
  //       //     data: (data) => data.requireValue.map(
  //       //       (x) => GuildIcon(
  //       //         guild: x,
  //       //         isSelected: x.id == selectedGuildId,
  //       //       ),
  //       //     ),
  //       //     error: (error) => [Text("ERROR")],
  //       //     loading: (loading) => [CircularProgressIndicator()],
  //       //   ),
  //       //   AddGuildIcon(),
  //       //   SizedBox(height: bottomSpace),
  //       // ],
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final guilds = ref.watch(guildsProvider);
  //   final selectedGuildId = ChatHostPage.of(context).guildId;
  //   return SizedBox(
  //     width: 80,
  //     child: SingleChildScrollView(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           DMIcon(
  //             unreadItems: 4,
  //           ),
  //           Divider(),
  //           ...guilds.map(
  //             data: (data) => data.requireValue.map(
  //               (x) => GuildIcon(
  //                 guild: x,
  //                 isSelected: x.id == selectedGuildId,
  //               ),
  //             ),
  //             error: (error) => [Text("ERROR")],
  //             loading: (loading) => [CircularProgressIndicator()],
  //           ),
  //           AddGuildIcon(),
  //           SizedBox(height: bottomSpace),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
