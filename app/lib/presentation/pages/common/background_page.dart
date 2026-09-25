import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riv/presentation/presentation.dart';

class const BackDropS({
  super.key,
  required final String shader,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FragmentProgram.fromAsset(shader)
          .then((program) => program.fragmentShader()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return BackdropFilter(
            filter: ImageFilter.shader(snapshot.data!),
            child: child,
          );
        }
      },
    );
  }
}

class const BackgroundPage({
  super.key,
  required final Widget child,
  required final bool isLoading,
  final bool drawLogo = false,
  final bool logoOutsideContainer = false,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Widget glassBuilder(Widget child) => GlassSurface(
      child: child,
    );
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          Assets.images.logo,
          width: 200,
        ),
        Space(space: 20),
        glassBuilder(child),
      ],
    );

    return LayoutBuilder.constraints(
      builder: (context, constraints) {
        final view = switch (LayoutType.fromConstraints(constraints)) {
          .phone => SingleChildScrollView(child: content),
          .tablet => SingleChildScrollView(child: content),
          .desktop => SingleChildScrollView(child: content),
        };
        return Stack(
          children: [
            // Animowane tło
            // AnimatedBackground(),
            // PlaceholderGrid(),
            // GlassSurface(
            //   child: SizedBox.expand(),
            // ),
            Align(
              child: Padding(padding: .all(16), child: view),
            ),
            if (isLoading)
              AnimatedOpacity(
                duration: context.values.fadeInDuration,
                opacity: isLoading ? 1 : 0,
                child: Center(
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: context.palette.hover,
                      borderRadius: context.values.borderL,
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
