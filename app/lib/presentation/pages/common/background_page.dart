import 'dart:math';
import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:riv/presentation/presentation.dart';

class const BackgroundPage({
  super.key,
  required final Widget child,
  required final bool isLoading,
  required final AnimationController controller,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final fadeAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
    final slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    final bgController =
        useAnimationController(
            duration: const Duration(seconds: 10),
          )
          ..repeat(reverse: true)
          ..animateTo(1);

    final c = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            // color: context.colors.body.background,
            border: Border.all(
              color: const Color(0xFF222831),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00ADB5).withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: slideAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.images.logo,
                    width: 200,
                  ),
                  Space(space: 20),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return LayoutBuilder.constraints(
      builder: (context, constraints) {
        final view = switch (LayoutType.fromConstraints(constraints)) {
          .phone => SingleChildScrollView(child: c),
          .tablet => SingleChildScrollView(child: c),
          .desktop => SingleChildScrollView(child: c),
        };
        return Stack(
          children: [
            // Animowane tło
            AnimatedBackground(),
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

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final random = Random();
  final List<Offset> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
            vsync: this,
            duration: const Duration(seconds: 10),
          )
          ..repeat()
          ..animateTo(1);
    for (int i = 0; i < 40; i++) {
      _particles.add(Offset(random.nextDouble(), random.nextDouble()));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final offset = _controller.value * 0.5;
        return CustomPaint(
          painter: _BackgroundPainter(_particles, offset),
          child: Container(),
        );
      },
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final List<Offset> particles;
  final double offset;
  _BackgroundPainter(this.particles, this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment(-1 + offset, -1 + offset),
      end: Alignment(1 - offset, 1 - offset),
      colors: const [Color(0xFF0A0A0A), Color(0xFF121212), Color(0xFF1A1A1A)],
    );
    final paint = Paint()..shader = gradient.createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, paint);

    final particlePaint = Paint()
      ..color = const Color(0xFF00ADB5).withOpacity(0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    for (final p in particles) {
      final dx = (p.dx + offset) % 1.0 * size.width;
      final dy = (p.dy + offset) % 1.0 * size.height;
      canvas.drawCircle(Offset(dx, dy), 2.5, particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) => true;
}
