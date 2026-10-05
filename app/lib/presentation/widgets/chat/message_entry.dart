import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:okidoki/core/core.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/mutations/mutations/chat/chat_mutations.dart';
import 'package:okidoki/providers/providers.dart';

// import 'package:super_clipboard/super_clipboard.dart';

class const MessageTextField({
  super.key,
  required final String hintText,
  final int? guildId,
  required final int channelId,
}) extends ConsumerStatefulWidget {
  @override
  ConsumerState<MessageTextField> createState() => MessageEntryState();
}

class MessageEntryState extends ConsumerState<MessageTextField> {
  late TextEditingController _inputController;

  @override
  void initState() {
    // final events = ClipboardEvents.instance;
    // events?.registerPasteEventListener((asdf) {
    //   debugPrint(asdf.toString());
    // });
    _inputController = TextEditingController()..addListener(onMessageChanged);
    super.initState();
  }

  void onMessageChanged() {
    ref.read(chatProvider(widget.channelId).notifier).sendTyping();
  }

  // FutureOr<void> _attachFile(DataReaderFile file) {
  //   debugPrint(file.fileName);
  //   return null;
  // }

  FutureOr<void> _attachFile(dynamic file) {
    debugPrint(file.fileName);
    return null;
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  final _textFieldKey = GlobalKey();
  final _focusNode = FocusNode();
  final _sendMutation = Mutation();

  @override
  Widget build(BuildContext context) {
    final chat = ref.watch(chatProvider(widget.channelId));

    final typingText = chat.usersTyping.isEmpty
        ? null
        : "${chat.usersTyping.keys.join(', ')} are typing...";

    var textField = Actions(
      actions: {
        PasteTextIntent: PasteSpecialAction(
          inputController: _inputController,
          attachFile: _attachFile,
        ),
        InsertNewlineIntent: InsertNewLineAction(_inputController),
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (intent) => _submit(),
        ),
      },
      child: TextField(
        key: _textFieldKey,
        controller: _inputController,
        contentInsertionConfiguration: ContentInsertionConfiguration(
          onContentInserted: (a) {
            debugPrint(a.toString());
          },
        ),
        focusNode: _focusNode,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: context.appColors.transparent,
          hintText: widget.hintText,
          prefixIcon: Icon(Icons.add_circle),

          maintainLabelSize: true,
          border: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        minLines: 1,
        maxLines: 5,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.send,
        onSubmitted: (_) => _submit(),
      ),
    );
    final attachments = [];

    final container = Surface(
      variant: .popup,
      // contextStyle: ContextColors.light,
      borderRadius: context.values.borderS,
      // decoration: BoxDecoration(
      //   borderRadius: .circular(8),
      //   color: Color(0xff444444),
      // ),
      // padding: .only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (attachments.isNotEmpty)
            SizedBox(
              height: 100,
              child: ListView.separated(
                padding: .all(8),
                scrollDirection: .horizontal,
                itemBuilder: (i, item) => AttachmentTile(),
                itemCount: attachments.length,
                separatorBuilder: (context, index) => SizedBox(width: 0),
              ),
            ),
          textField,
        ],
      ),
    );
    return Column(
      children: [
        SizedBox(
          height: 24,
          child: Row(
            children: [if (typingText != null) Text(typingText)],
          ),
        ),
        container,
      ],
    );
  }

  Future<void> _submit() async {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;

    // reset text field first (or after, your choice)
    _inputController.clear();
    // optional: keep cursor ready
    _focusNode.requestFocus();

    _sendMutation.run(
      ref,
      ChatMutations.sendMessageCb(
        chatId: widget.channelId.toString(),
        content: text,
      ),
    );
  }
}
