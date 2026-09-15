import 'dart:async';

import 'package:riv/presentation/presentation.dart';

class PasteSpecialAction extends CallbackAction<PasteTextIntent> {
  final FutureOr<void> Function(dynamic file) _attachFile;
  final TextEditingController _inputController;
  new({required this._inputController, required this._attachFile})
    : super(onInvoke: (_) => null);

  @override
  Object? Function(PasteTextIntent intent) get onInvoke =>
      (intent) => _handlePaste();

  Future<void> _handlePaste() async {}

  void _pasteText(String text) {
    final cursorPosition = _inputController.selection.base.offset;
    if (cursorPosition == -1) {
      _inputController.text = text;
    } else {
      final newText = _inputController.text.replaceRange(
        _inputController.selection.start,
        _inputController.selection.end,
        text,
      );
      _inputController.value = _inputController.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(
          offset: _inputController.selection.start + text.length,
        ),
      );
    }
  }
}

// import 'package:super_clipboard/super_clipboard.dart';

// const imageFormats = [
//   Formats.jpeg,
//   Formats.png,
//   Formats.svg,
//   Formats.gif,
//   Formats.webp,
//   Formats.tiff,
//   Formats.bmp,
//   Formats.ico,
//   Formats.heic,
//   Formats.heif,
// ];
// const videoFormats = [
//   Formats.mp4,
//   Formats.mov,
//   Formats.m4v,
//   Formats.avi,
//   Formats.mpeg,
//   Formats.webm,
// ];
// const audioFormats = [
//   Formats.ogg,
//   Formats.wmv,
//   Formats.flv,
//   Formats.mkv,
//   Formats.ts,
//   Formats.mp3,
//   Formats.oga,
//   Formats.aac,
//   Formats.wav,
// ];

// class PasteSpecialAction extends CallbackAction<PasteTextIntent> {
//   final FutureOr<void> Function(DataReaderFile file) _attachFile;
//   final TextEditingController _inputController;
//   new({required this._inputController, required this._attachFile})
//     : super(onInvoke: (_) => null);

//   @override
//   Object? Function(PasteTextIntent intent) get onInvoke =>
//       (intent) => _handlePaste();

//   Future<void> _handlePaste() async {
//     final clipboard = SystemClipboard.instance;
//     if (clipboard == null) {
//       return;
//     }
//     final reader = await clipboard.read();
//     debugPrint('------');
//     for (final format in imageFormats) {
//       if (reader.canProvide(format)) {
//         debugPrint(format.toString());
//         reader.getFile(format, _attachFile);
//         return;
//       }
//     }
//     for (final format in videoFormats) {
//       if (reader.canProvide(format)) {
//         debugPrint(format.toString());
//         reader.getFile(format, _attachFile);
//         return;
//       }
//     }
//     for (final format in audioFormats) {
//       if (reader.canProvide(format)) {
//         debugPrint(format.toString());
//         reader.getFile(format, _attachFile);
//         return;
//       }
//     }
//     // reader.getFile(Formats.uri, (r) {
//     //   final content = r.readAll();
//     //   print(content);
//     // });
//     if (reader.canProvide(Formats.plainText)) {
//       final text = await reader.readValue(Formats.plainText);
//       if (text != null) _pasteText(text);
//       return;
//     }
//   }

//   void _pasteText(String text) {
//     final cursorPosition = _inputController.selection.base.offset;
//     if (cursorPosition == -1) {
//       _inputController.text = text;
//     } else {
//       final newText = _inputController.text.replaceRange(
//         _inputController.selection.start,
//         _inputController.selection.end,
//         text,
//       );
//       _inputController.value = _inputController.value.copyWith(
//         text: newText,
//         selection: TextSelection.collapsed(
//           offset: _inputController.selection.start + text.length,
//         ),
//       );
//     }
//   }
// }
