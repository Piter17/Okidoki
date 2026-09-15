import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/mutations/mutations/chat/chat_mutations.dart';

// import 'package:super_clipboard/super_clipboard.dart';

class const MessageEntry({
  super.key,
  required final String hintText,
  required final String channelId,
}) extends ConsumerStatefulWidget {
  @override
  ConsumerState<MessageEntry> createState() => MessageEntryState();
}

class MessageEntryState extends ConsumerState<MessageEntry> {
  late final _inputController = TextEditingController();

  // @override
  // void initState() {
  // final events = ClipboardEvents.instance;
  // events?.registerPasteEventListener((asdf) {
  //   debugPrint(asdf.toString());
  // });
  //   super.initState();
  // }

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
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(Icons.add_circle),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        minLines: 1,
        maxLines: 5,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.send,
        onSubmitted: (_) => _submit(),
      ),
    );

    final container = StyledContainer(
      contextStyle: ContextColors.light,
      // decoration: BoxDecoration(
      //   borderRadius: .circular(8),
      //   color: Color(0xff444444),
      // ),
      padding: .only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            child: ListView.separated(
              padding: .all(8),

              scrollDirection: .horizontal,
              itemBuilder: (i, item) => AttachmentTile(),
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(width: 0),
            ),
          ),
          textField,
        ],
      ),
    );
    return container;
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
        chatId: widget.channelId,
        content: text,
      ),
    );
  }
}
