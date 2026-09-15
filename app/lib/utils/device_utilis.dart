import 'dart:io';

import 'package:flutter/foundation.dart';

class DeviceUtils {
  static bool? _isPhone;
  static bool get isPhone {
    return _isPhone ??
        (_isPhone = kIsWeb ? false : Platform.isIOS || Platform.isAndroid);
  }
}
