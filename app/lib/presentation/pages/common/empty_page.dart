import 'dart:math' as math;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';

@RoutePage()
class EmptyPage extends HookWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final variants = SurfaceThemes.values;

    return Stack(
      children: [
        PlaceholderGrid(
          maxCellSize: 100,
          getColor: (x, y) =>
              HSVColor.fromAHSV(1, (x + y) % 360, .4, (x / 10) % 1.0).toColor(),
        ),
        Align(
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                // OverlayButton(),
                // SizedBox(
                //   width: 100,
                //   height: 20,
                //   child: OverlayButton(),
                // ),
                CtxMenuRegion(
                  items: [
                    CtxMenuItem(
                      label: (context) => 'Print',
                      onPressed: () {},
                    ),
                    CtxMenuItem(
                      label: (context) => 'Copy',
                      onPressed: () {},
                    ),
                  ],
                  child: ColoredBox(
                    color: Colors.green,
                    child: Center(child: Text('asd')),
                  ),
                ),

                Button(
                  onPressed: () => b(context),
                  child: Text('Click Me'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void b(BuildContext context) => showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.6),
    builder: (_) => BlurDialog(),
  );

  void a(BuildContext context) => showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.6),
    builder: (_) {
      return GlassModal(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Utwórz kanał tekstowy",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),

            Text(
              "NAZWA KANAŁU",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 6),

            TextField(
              decoration: InputDecoration(
                hintText: "# nowy-kanał",
                filled: true,
                fillColor: Colors.white.withOpacity(0.06),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Text(
                    "PRYWATNY KANAŁ\nTylko wybrane osoby będą miały dostęp",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Switch(value: true, onChanged: (_) {}),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: context.pop, child: const Text("Anuluj")),
                const SizedBox(width: 12),
                FilledButton(onPressed: () {}, child: const Text("Utwórz")),
              ],
            ),
          ],
        ),
      );
    },
  );
}

class BlurDialog extends HookWidget {
  final double blur;

  const BlurDialog({super.key, this.blur = 30});

  @override
  Widget build(BuildContext context) {
    final padding = const EdgeInsets.all(24);
    final initialBlur = 30.0;
    final initialOpacity = 0.12;
    final initialBorderOpacity = 0.25;
    final shad = useState(false);
    final blur = useState(initialBlur);
    final opacity = useState(initialOpacity);
    final borderOpacity = useState(initialBorderOpacity);

    final fut = useFuture(
      FragmentProgram.fromAsset('assets/shaders/glass2.frag')
          .then((program) => ImageFilter.shader(program.fragmentShader())),
    );
    return Dialog(
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints.tightFor(
        width: 400,
        height: 300,
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: shad.value
                ? fut.data?.mapOr(
                    pass,
                    ImageFilter.blur(sigmaX: blur.value, sigmaY: blur.value),
                  )
                : ImageFilter.blur(sigmaX: blur.value, sigmaY: blur.value),
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface
                    .withOpacity(opacity.value),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(borderOpacity.value),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 40,
                    spreadRadius: -4,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Utwórz kanał tekstowy",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Switch(
                    value: shad.value,
                    onChanged: (value) => shad.value = value,
                  ),
                  if (shad.value == false)
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Blur $initialBlur",
                        hintText: initialBlur.toString(),
                      ),
                      onChanged: (value) => blur.value =
                          (double.tryParse(value) ?? initialBlur).clamp(0, 100),
                    ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Opacity $initialOpacity",
                      hintText: initialOpacity.toString(),
                    ),
                    onChanged: (value) => opacity.value =
                        (double.tryParse(value) ?? initialOpacity).clamp(0, 1),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Border Opacity $initialBorderOpacity",
                      hintText: initialBorderOpacity.toString(),
                    ),
                    onChanged: (value) => borderOpacity.value =
                        (double.tryParse(value) ?? initialBorderOpacity).clamp(
                          0,
                          1,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassModal extends HookWidget {
  final Widget child;
  final EdgeInsets padding;
  final double blur;
  final double opacity;
  final double borderOpacity;
  final Duration duration;

  const GlassModal({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.blur = 30,
    this.opacity = 0.12,
    this.borderOpacity = 0.25,
    this.duration = const Duration(milliseconds: 240),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints.tightFor(
        width: 400,
        height: 300,
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(opacity),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(borderOpacity),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 40,
                    spreadRadius: -4,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ),
      ),
    );

    // return FadeTransition(
    //   opacity: animation,
    //   child: ScaleTransition(
    //     scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
    //     child:

    //   ),
    // );
  }
}
