import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:riv/core/types/file_content.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/mutations/mutations.dart';
import 'package:riv/utils/utils.dart';

@RoutePage()
class AddGuildPage extends HookConsumerWidget {
  const AddGuildPage({super.key});

  static Future<void> open(BuildContext context) {
    return showResponsivePopup(
      context: context,
      builder: (context) => AddGuildPage(),
      dialogConstraints: BoxConstraints(maxWidth: 360, maxHeight: 350),
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
    return StyledContainer(
      decoration: BoxDecoration(
        borderRadius: context.values.borderL,
      ),
      contextStyle: ContextColors.light,
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
    final img = useState<Uint8List?>(null);

    final guildNameController = useTextEditingController(
      text: "Gildia użytkownika ${user.nickname}",
    );

    createGuild.showPopupOnError(context, ref);

    final createState = ref.watch(createGuild);
    if (createState.isSuccess) Navigator.pop(context);

    return Padding(
      padding: context.values.containerPadding,
      child: Column(
        spacing: context.values.spacing,
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogHeader(
            text: context.s.guild_create_title,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: InkResponse(
                    onTap: () async {
                      final result = await FilePicker.pickFiles(
                        type: FileType.image,
                      );
                      if (result.length == 1) {
                        if (kIsWeb) {
                          img.value = await result.first.readAsBytes();
                        } else {
                          File file = File(result.first.path!);
                          img.value = await file.readAsBytes();
                        }
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage: img.value != null
                          ? MemoryImage(img.value!)
                          : null,
                    ),
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
                            image: img.value == null
                                ? null
                                : FileContent(
                                    content: img.value!,
                                    contentType: "application/octet-stream",
                                    fileName: "asd.png",
                                  ),
                          ),
                        ),
                  child: Text(context.s.guild_create_button),
                ),
                TextFormField(
                  controller: guildNameController,
                ),
                Text(context.s.guild_join_prompt),
                Button(
                  onPressed: changePage,
                  buttonType: ButtonType.secondary,
                  child: Text(context.s.guild_join_button),
                ),
              ],
            ),
          ),
        ],
      ),
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

    return Padding(
      padding: context.values.containerPadding,
      child: Column(
        spacing: context.values.spacing,
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogHeader(
            text: context.s.guild_join_title,
          ),
          TextField(
            onChanged: setCode,
            controller: invitationController,
            decoration: InputDecoration(hint: Text('invitation code')),
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
      ),
    );
  }
}
