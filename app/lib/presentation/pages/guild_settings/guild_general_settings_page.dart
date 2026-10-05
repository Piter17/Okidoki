import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/utils/utils.dart';

class const GuildGeneralSettingsPage({
  super.key,
  required final int _guildId,
}) extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      GuildGeneralSettingsPageState();
}

class GuildGeneralSettingsPageState
    extends ConsumerState<GuildGeneralSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final guild = ref.watch(guildProvider(widget._guildId));

    final formKey = GlobalKey<FormState>(
      debugLabel: "GuildGeneralSettingsPage.form",
    );

    final nameKey = GlobalKey(debugLabel: "form.nameKey");

    return BaseSettingsScreen(
      formKey: formKey,
      save: (formState) async {
        debugPrint("save");
        formState.save();
        formState.fields.where((x) => x.isDirty).forEach((x) => x.save());
        debugPrint("save2");
      },
      child: Skeletonizer(
        enabled: guild.isLoading,
        child: Column(
          children: [
            TitleEntry(Text(context.s.guild_title)),
            ImageFormPicker(
              initialImage: guild.value?.image,
              radius: 200,
              onSaved: (newValue) {
                debugPrint("image onSaved $newValue");
              },
            ),
            TextFormEntry(
              text: Text(context.s.guild_name),
              fieldKey: nameKey,
              value: guild.value?.name ?? TextGen.guildName(),
              onSaved: (v) => debugPrint("name: $v"),
            ),
          ],
        ),
      ),
    );
  }
}
