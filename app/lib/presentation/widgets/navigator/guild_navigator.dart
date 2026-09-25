import 'package:auto_route/auto_route.dart';
import 'package:api_bindings/api_bindings.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';

class const SideNavigatorBase({
  super.key,
  final Widget? top,
  final Widget? child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomSpace = NavigationPaneLayoutScope.of(context).bottomSpace;
    return Surface(
      // contextStyle: .dark,
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.values.topBarHeight,
            child: top,
          ),
          Divider.shrink(),
          if (child != null) Expanded(child: child!),
          if (bottomSpace != null) SizedBox(height: bottomSpace),
        ],
      ),
    );
  }
}

class const GuildNavigator({
  super.key,
  required final String? guildId,
  required final String? channelId,
}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (guildId == null) {
      return SideNavigatorBase();
    }

    final guild = ref.watch(guildProvider(guildId!));

    final channels = guild.value?.channels;
    final isLoading = guild.isLoading;

    final itemCount = isLoading ? 10 : channels?.length ?? 0;

    return SideNavigatorBase(
      top: GuildHeader(guildId: guildId),
      child: Skeletonizer(
        enabled: isLoading,
        child: ListView.builder(
          padding: context.values.containerPadding,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return guild.map(
              data: (data) {
                final channel = channels![index];
                return ChannelEntryIconContextMenu(
                  channel: channel,
                  child: ChannelEntry(
                    channel,
                    channel.id == channelId,
                    onTapOverride: () => context.router.push(
                      GuildChatRoute(guildId: guildId!, channelId: channel.id),
                    ),
                  ),
                );
              },
              error: (e) => Text(e.toString()),
              loading: (l) => ChannelEntry.skeleton(),
            );
          },
        ),
      ),
    );
  }
}

class ChannelEntry extends StatelessWidget {
  final bool isSelected;
  final String? guildId;
  final String? channelId;
  final String? _name;
  final bool isSkeleton;
  final VoidCallback? onTapOverride;

  ChannelEntry(
    GuildChannelDto channel,
    this.isSelected, {
    super.key,
    this.onTapOverride,
  }) : isSkeleton = false,
       guildId = channel.guildId,
       channelId = channel.id,
       _name = channel.name;

  const ChannelEntry.skeleton({super.key})
    : isSkeleton = true,
      isSelected = false,
      guildId = null,
      channelId = null,
      _name = null,
      onTapOverride = null;

  @override
  Widget build(BuildContext context) {
    final name = _name ?? TextGen.channelName();
    final onTap = isSkeleton ? null : (onTapOverride ?? () {});

    return Skeletonizer(
      enabled: isSkeleton,
      child: DefaultTextStyle.merge(
        overflow: .ellipsis,
        style: isSelected
            ? context.fonts.bodyStronger
            : context.fonts.bodyStrong,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: context.values.border,
            color: context.palette.getHover(isSelected),
          ),
          child: InkWell(
            hoverColor: context.palette.hover,
            onTap: onTap,
            borderRadius: context.values.borderS,
            child: Padding(
              padding: context.values.iconPadding,
              child: Row(
                children: [
                  Icon(Icons.tag),
                  Space(),
                  Expanded(child: Text(name)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class const GuildHeader({super.key, required final String? guildId})
    extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guild = guildId == null ? null : ref.watch(guildProvider(guildId!));
    final guildName = guild?.value?.name ?? TextGen.guildName();

    final isHovered = useState(false);

    return Skeletonizer(
      enabled: guild?.isLoading == true,
      child: Padding(
        padding: context.values.containerPadding,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          children: [
            Expanded(
              child:
                  InkWell(
                    borderRadius: context.values.border,
                    onHover: isHovered.set,
                    onTap: () {},
                    child: Container(
                      padding: context.values.containerPadding,
                      decoration: BoxDecoration(
                        borderRadius: context.values.border,
                        color: context.palette.getHover(isHovered.value),
                      ),
                      child: Text(
                        guildName,
                        overflow: .ellipsis,
                        style: context.fonts.subtitle2Stronger,
                      ),
                    ),
                  ).wrapIf(
                    guild?.hasValue == true,
                    (x) => GuildHeaderContextMenu(
                      guild: guild!.requireValue,
                      child: x,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
