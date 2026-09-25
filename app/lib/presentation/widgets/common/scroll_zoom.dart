import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';
import 'package:scaled_app/scaled_app.dart';

class ScrollZoom extends HookWidget {
  final Widget child;

  const ScrollZoom({super.key, required this.child});

  static const scrollFactors = <double>[
    ...[0.25, 0.33, 0.5, 0.67, 0.75, 0.8, 0.9, 1],
    ...[1.1, 1.25, 1.5, 1.75, 2, 2.5, 3, 4, 5],
  ];

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return child;
    }
    final scale = useState(scrollFactors.indexOf(1));
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          if (isShortcutModifierPressed) {
            var s = scale.value;
            s += pointerSignal.scrollDelta.dy > 0 ? -1 : 1;
            s = s.clamp(0, scrollFactors.length - 1);
            scale.value = s;
            ScaledWidgetsFlutterBinding.instance.scaleFactor = (x) =>
                scrollFactors[s];
          }
        }
      },
      child: child,
    );
  }
}
