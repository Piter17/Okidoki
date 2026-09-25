import 'package:auto_route/auto_route.dart';
import 'package:api_bindings/api_bindings.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/mutations/mutations.dart';
import 'package:riv/utils/utils.dart';

@RoutePage()
class FriendsPage extends HookConsumerWidget {
  const FriendsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    final received = ref.watch(receivedFriendRequestsProvider).requireValue;
    final sent = ref.watch(sentFriendRequestsProvider).requireValue;

    return BaseMainScreen(
      topBar: FriendsTopBar(),
      body: CustomScrollView(
        controller: scrollController,
        slivers:
            [
                  SliverToBoxAdapter(child: TextField()),
                  if (received.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Text(context.s.friends_received(received.length)),
                    ),
                    SliverList.builder(
                      itemCount: received.length,
                      itemBuilder: (context, index) =>
                          ReceivedFriendRequestEntry(request: received[index]),
                    ),
                  ],
                  if (sent.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Text(context.s.friends_sent(sent.length)),
                    ),
                    SliverList.builder(
                      itemCount: sent.length,
                      itemBuilder: (context, index) =>
                          SentFriendRequestEntry(request: sent[index]),
                    ),
                    SliverList.separated(
                      separatorBuilder: (context, index) => Space(space: 4),
                      itemCount: 10,
                      itemBuilder: (context, index) =>
                          SentFriendRequestEntry.skeleton(),
                    ),
                  ],
                ]
                .map(
                  (e) => SliverPadding(
                    padding: context.values.containerPadding,
                    sliver: e,
                  ),
                )
                .toList(),
      ),
    );
  }
}

class FriendsTopBar extends BaseTopBar {
  const FriendsTopBar({super.key});

  @override
  List<Widget>? get actions => [Icon(Icons.phone), Icon(Icons.pin)];

  @override
  Widget build(BuildContext context) => BaseTopBar(
    title: Text(context.s.friends_title),
    actions: actions,
  ).build(context);
}

class ReceivedFriendRequestEntry extends ConsumerWidget {
  const new({
    super.key,
    required ReceivedRequestDto this.request,
  });

  const new skeleton({super.key}) : request = null;

  final ReceivedRequestDto? request;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mutation = useMemoized(FriendMutations.getAcceptInvite);
    mutation.showPopupOnError(context, ref);
    return BaseFriendRequestEntry(
      profilePicture: request?.sender.profilePicture,
      nickname: request?.sender.nickname! ?? TextGen.nick(),
      username: request?.sender.userName! ?? TextGen.nick(),
      hasAcceptButton: true,
      accept: request == null
          ? null
          : () => mutation.run(
              ref,
              FriendMutations.acceptInviteCb(request!.sender.id),
            ),
      decline: request == null ? null : () {},
    );
  }
}

class SentFriendRequestEntry extends StatelessWidget {
  const new({
    super.key,
    required SentRequestDto this.request,
  });

  const new skeleton({super.key}) : request = null;

  final SentRequestDto? request;

  @override
  Widget build(BuildContext context) {
    return BaseFriendRequestEntry(
      profilePicture: request?.target.profilePicture,
      nickname: request?.target.nickname! ?? TextGen.nick(),
      username: request?.target.userName! ?? TextGen.nick(),
      decline: request == null ? null : () {},
    );
  }
}

class BaseFriendRequestEntry extends HookWidget {
  const new({
    super.key,
    required this.profilePicture,
    required this.nickname,
    required this.username,
    this.accept,
    this.decline,
    this.hasAcceptButton = false,
  });

  final String? profilePicture;
  final String nickname;
  final String username;
  final void Function()? accept;
  final void Function()? decline;
  final bool hasAcceptButton;

  @override
  Widget build(BuildContext context) {
    final hovered = useState(false);
    return InkWell(
      borderRadius: context.values.borderXL,
      onHover: hovered.set,
      onTap: () {},
      child: Row(
        children: [
          UserAvatar(image: profilePicture),
          Space(),
          Column(
            children: [
              Text(nickname),
              Text(username),
            ],
          ),
          Spacer(),
          if (hasAcceptButton) ...[
            IconButton(onPressed: accept, icon: Icon(Icons.check)),
            Space(),
          ],
          IconButton(onPressed: decline, icon: Icon(Icons.close)),
        ],
      ),
    ).wrapIf(
      hovered.value,
      (x) => Surface(child: x),
    );
  }
}
