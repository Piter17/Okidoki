import 'dart:io';

import 'package:flutter/services.dart';

bool isShortcutModifierPressed = Platform.isMacOS || Platform.isIOS
    ? HardwareKeyboard.instance.isMetaPressed
    : HardwareKeyboard.instance.isControlPressed;
