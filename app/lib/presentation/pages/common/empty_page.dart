import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/utils/utils.dart';

@RoutePage()
class EmptyPage extends HookWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }

  void b(BuildContext context) => showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.6),
    builder: (_) => BlurDialog(),
  );

  void a(BuildContext context) => showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.6),
    builder: (_) {
      return GlassDialog(
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
                fillColor: Colors.white.withValues(alpha: 0.06),
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
                    .withValues(alpha: opacity.value),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha: borderOpacity.value),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.35),
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

class const GlassModal({
  super.key,
  required final Widget child,
  required final bool asDialog,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      asDialog: asDialog,
      child: child,
    );
  }
}

class const GlassDialog({
  super.key,
  required final Widget child,
  final BoxConstraints? constraints = const BoxConstraints(
    maxWidth: 1500,
    maxHeight: 800,
    minHeight: 350,
    minWidth: 360,
  ),
  final String? text,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      constraints: constraints,
      child: GlassModal(
        asDialog: true,
        child: child,
      ),
    );
  }
}
