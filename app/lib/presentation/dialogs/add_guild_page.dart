import 'package:auto_route/auto_route.dart';
import 'package:okidoki/core/core.dart';
import 'package:okidoki/mutations/mutations.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/utils/utils.dart';

@RoutePage()
class AddGuildPage extends HookConsumerWidget {
  const AddGuildPage({super.key});

  static Future<void> open(BuildContext context) {
    return showResponsivePopup(
      context: context,
      builder: (context) => AddGuildPage(),
      dialogConstraints: BoxConstraints(maxWidth: 360, maxHeight: 409),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    void changePage(int i) => controller.animateToPage(
      i,
      duration: Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
    return BaseDialog(
      title: controller.currentPage == 0
          ? context.s.guild_create_title
          : context.s.guild_join_title,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 360,
          height: 350,
        ),
        child: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _CreateGuild(
              changePage: () => changePage(1),
            ),
            _JoinGuild(
              changePage: () => changePage(0),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateGuild extends HookConsumerWidget {
  const new({required this.changePage});
  final void Function() changePage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createGuild = useMemoized(GuildMutations.getCreate);
    final user = ref.watch(currentUserProfileProvider).requireValue;
    final img = useState<FileContent?>(null);

    final guildNameController = useTextEditingController(
      text: "Społeczność użytkownika ${user.nickname}",
    );

    createGuild.showPopupOnError(context, ref);
    createGuild.onSuccess(context, ref, context.pop);

    final createState = ref.watch(createGuild);

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: context.values.spacing,
      children: [
        Text(context.s.guild_create_prompt),
        SizedBox.square(
          dimension: 100,
          child: ImagePicker(
            diameter: 100,
            value: img.value,
            onChanged: (image) => img.value = image,
          ),
        ),
        TextFormField(
          controller: guildNameController,
          decoration: InputDecoration(
            labelText: context.s.guild_name,
            hintText: " ",
          ),
        ),
        Button(
          buttonType: ButtonType.primary,
          onPressed: createState is MutationPending
              ? null
              : () => createGuild.run(
                  ref,
                  GuildMutations.createCb(
                    name: guildNameController.text,
                    image: img.value,
                  ),
                ),
          child: Text(context.s.guild_create_button),
        ),
        Text(context.s.guild_join_prompt),
        Button(
          onPressed: changePage,
          buttonType: ButtonType.secondary,
          child: Text(context.s.guild_join_button),
        ),
      ],
    );
  }
}

class _JoinGuild extends HookConsumerWidget {
  final void Function() changePage;

  const new({required this.changePage});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final joinGuildMutation = useMemoized(GuildMutations.getJoin);
    final invitationController = useTextEditingController();

    final code = useState<String?>(null);
    final joinState = ref.watch(joinGuildMutation);

    joinGuildMutation.showPopupOnError(context, ref);

    void setCode(String? text) =>
        code.value = GuildInvitationService.toInvitationCode(text);

    return Column(
      spacing: context.values.spacing,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.s.guild_join_prompt),
        TextField(
          onChanged: setCode,
          controller: invitationController,
          decoration: InputDecoration(hint: Text('invitation code')),
        ),
        Text(
          context.s.guild_join_invitation_url_help(
            "XXXXXXXXXX",
            ReleaseConfig.getInviteUrl("XXXXXXXXXX"),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Button(
              onPressed: changePage,
              buttonType: .text,
              child: Text(context.s.generic_back),
            ),
            Button(
              onPressed: joinState is MutationPending || code.value == null
                  ? null
                  : () => joinGuildMutation
                        .run(ref, GuildMutations.joinCb(code: code.value!))
                        .then(
                          (_) => context.mounted.then(
                            () => Navigator.pop(context),
                          ),
                        ),
              buttonType: ButtonType.primary,
              child: Text(context.s.guild_join_button),
            ),
          ],
        ),
      ],
    );
  }
}
