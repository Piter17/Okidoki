import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';

class const GuildGeneralSettingsPage({
  super.key,
  required final String _guildId,
  // required final GlobalKey<FormState> formKey,
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
        // print(formKey.currentState?.fields);
        // print(formKey.currentState?.fields.where((x) => x.))
        debugPrint("save");
        formState.save();
        formState.fields.where((x) => x.isDirty).forEach((x) => x.save());
        // formState.fields
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
              // onChanged: (img) => updateImage.run(
              //   ref,
              //   GuildMutations.updateImage(
              //     guildId: widget._guildId,
              //     image: img,
              //   ),
              // ),
            ),
            TextFormEntry(
              text: Text(context.s.guild_name),
              fieldKey: nameKey,
              value: guild.value?.name ?? TextGen.guildName(),
              onSaved: (v) => debugPrint("name: $v"),
            ),
            // TextFormEntry(
            //   text: Text("Nazwa gildii2"),
            //   fieldKey: nameKey2,
            //   value: guild.value?.guildProfile?.name ?? "asdfasdfasdfasdf",
            //   onSaved: (v) => debugPrint("name2: $v"),
            // ),
          ],
        ),
      ),
    );
  }
}
