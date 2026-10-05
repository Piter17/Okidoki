// import 'package:super_clipboard/super_clipboard.dart';
import 'package:flutter/services.dart';

class ClipboardHelpers {
  static Future<void> setText(String value) {
    return Clipboard.setData(ClipboardData(text: value));

    // final clipboard = SystemClipboard.instance;
    // if (clipboard == null) {
    //   return; // Clipboard API is not supported on this platform.
    // }
    // final item = DataWriterItem();
    // item.add(Formats.plainText(value));
    // clipboard.write([item]);
  }
}
