import 'dart:math';

import 'package:flutter_svg/svg.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

const _designSize = Size(1920, 1080);

class const BackgroundPage({
  super.key,
  required final Widget child,
  required final bool isLoading,
  final bool drawLogo = false,
  final bool logoOutsideContainer = false,
}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appVersion = ref.watch(appVersionProvider);

    final constrained = ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 500,
        maxWidth: 300,
      ),
      child: Padding(
        padding: context.values.containerPaddingXL,
        child: Column(
          children: [
            Expanded(child: child),
            Align(
              alignment: .bottomRight,
              child: Text(
                'Version ${appVersion.version} (${appVersion.buildNumber})',
                textAlign: .end,
                style: context.fonts.caption2,
              ),
            ),
          ],
        ),
      ),
    );

    final content = Padding(
      padding: context.values.containerPaddingXL,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.images.logo,
            width: 200,
          ),
          Space(space: 20),
          GlassSurface(asDialog: true, child: constrained),
        ],
      ),
    );

    final view = LayoutBuilder.constraints(
      builder: (context, constraints) =>
          switch (LayoutType.fromConstraints(constraints)) {
            .phone => SingleChildScrollView(child: content),
            .tablet => SingleChildScrollView(child: content),
            .desktop => SingleChildScrollView(child: content),
          },
    );

    return SizedBox.expand(
      child: AnimatedBackground(child: view),
    );
  }
}

class const AnimatedBackground({
  super.key,
  required final Widget child,
}) extends StatefulWidget {
  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final random = Random();
  final List<_Particle> _particles = [];
  double _lastProgress = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    _particles.addAll(List.generate(64, (_) => _generateParticle()));
  }

  double _randRange(double min, double max) =>
      min + random.nextDouble() * (max - min);

  T _randChoice<T>(List<T> options) => options[random.nextInt(options.length)];

  _Particle _generateParticle({Size? viewport, bool entering = false}) {
    final particleSize = _randRange(12, 24);
    final position = entering && viewport != null
        ? _randomEntryPosition(viewport, particleSize)
        : Offset(_randRange(0, 1), _randRange(0, 1));

    return _Particle(
      position: position,
      shape: _randChoice(_ParticleShape.values),
      color: _randChoice(const [
        Color(0xFF00ADB5),
        Color(0xFF65D6CE),
        Color(0xFF8FE3CF),
        Color(0xFF75BDE0),
      ]),
      size: particleSize,
      opacity: _randRange(0.35, 0.75),
      speed: _randRange(12, 24),
      angle: _randRange(.2, .4) * 2 * pi,
      rotation: _randRange(0, 2 * pi),
      angularVelocity: _randRange(0.3, 1.5) * _randChoice([-1.0, 1.0]),
    );
  }

  Offset _randomEntryPosition(Size viewport, double particleSize) {
    if (random.nextBool()) {
      return Offset(
        -particleSize / viewport.width,
        _randRange(0, 1),
      );
    }
    return Offset(
      _randRange(0, 1),
      -particleSize / viewport.height,
    );
  }

  void _advanceParticles(Size size, double elapsed) {
    if (size.width <= 0 || size.height <= 0) return;

    for (var index = 0; index < _particles.length; index++) {
      final particle = _particles[index];
      if (particle.respawnIn > 0) {
        particle.respawnIn -= elapsed;
        if (particle.respawnIn <= 0) {
          _particles[index] = _generateParticle(
            viewport: size,
            entering: true,
          );
        }
        continue;
      }

      final distance = particle.speed * elapsed;
      particle.rotation += particle.angularVelocity * elapsed;
      particle.position = Offset(
        particle.position.dx + cos(particle.angle) * distance / size.width,
        particle.position.dy + sin(particle.angle) * distance / size.height,
      );

      final x = particle.position.dx * size.width;
      final y = particle.position.dy * size.height;
      if (x < -particle.size ||
          x > size.width + particle.size ||
          y < -particle.size ||
          y > size.height + particle.size) {
        particle.respawnIn = 0.1;
      }
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
      child: SizedBox.expand(child: Align(child: widget.child)),
      builder: (context, child) {
        final progress = _controller.value;
        final elapsed = (progress - _lastProgress + 1) % 1 * 10;
        _lastProgress = progress;

        _advanceParticles(_designSize, elapsed);
        return CustomPaint(
          painter: _BackgroundPainter(_particles),
          child: child,
        );
      },
    );
  }
}

enum _ParticleShape { circle, plus, star, diamond, ring }

class _Particle {
  Offset position;
  final _ParticleShape shape;
  final Color color;
  final double size;
  final double opacity;
  final double speed;
  final double angle;
  double rotation;
  final double angularVelocity;
  double respawnIn = 0;

  _Particle({
    required this.position,
    required this.shape,
    required this.color,
    required this.size,
    required this.opacity,
    required this.speed,
    required this.angle,
    required this.rotation,
    required this.angularVelocity,
  });
}

class _BackgroundPainter extends CustomPainter {
  final List<_Particle> particles;

  _BackgroundPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final backgroundPaint = Paint()..color = const Color(0xFF465155);
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    canvas.save();
    canvas.clipRect(Offset.zero & size);
    canvas.translate(
      (size.width - _designSize.width) / 2,
      (size.height - _designSize.height) / 2,
    );

    for (final particle in particles) {
      if (particle.respawnIn > 0) continue;

      final center = Offset(
        particle.position.dx * _designSize.width,
        particle.position.dy * _designSize.height,
      );
      final direction = Offset(cos(particle.angle), sin(particle.angle));
      final trailPaint = Paint()
        ..color = particle.color.withOpacity(particle.opacity * 0.22)
        ..strokeWidth = 1.5
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(
        center - direction * (particle.size * 1.4),
        center - direction * (particle.size * 0.45),
        trailPaint,
      );

      final paint = Paint()
        ..color = particle.color.withOpacity(particle.opacity)
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(particle.rotation);
      final glowPaint = Paint()
        ..color = particle.color.withOpacity(particle.opacity * 0.3)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          particle.size * 0.35,
        );
      canvas.drawCircle(Offset.zero, particle.size * 0.65, glowPaint);

      switch (particle.shape) {
        case _ParticleShape.circle:
          canvas.drawCircle(Offset.zero, particle.size / 2, paint);
          canvas.drawCircle(
            Offset(-particle.size * 0.14, -particle.size * 0.14),
            particle.size * 0.12,
            Paint()
              ..color = const Color(0xFFFFFFFF).withOpacity(
                particle.opacity * 0.65,
              ),
          );
        case _ParticleShape.plus:
          paint
            ..style = PaintingStyle.stroke
            ..strokeWidth = particle.size * 0.12
            ..strokeCap = StrokeCap.round;
          final arm = particle.size / 2;
          canvas.drawLine(Offset(-arm, 0), Offset(arm, 0), paint);
          canvas.drawLine(Offset(0, -arm), Offset(0, arm), paint);
        case _ParticleShape.diamond:
          final radius = particle.size / 2;
          final path = Path()
            ..moveTo(0, -radius)
            ..lineTo(radius, 0)
            ..lineTo(0, radius)
            ..lineTo(-radius, 0)
            ..close();
          canvas.drawPath(path, paint);
        case _ParticleShape.ring:
          paint
            ..style = PaintingStyle.stroke
            ..strokeWidth = particle.size * 0.12;
          canvas.drawCircle(Offset.zero, particle.size * 0.35, paint);
        case _ParticleShape.star:
          final path = Path();
          for (var point = 0; point < 10; point++) {
            final radius = point.isEven ? particle.size / 2 : particle.size / 4;
            final angle = -pi / 2 + point * pi / 5;
            final position = Offset(
              cos(angle) * radius,
              sin(angle) * radius,
            );
            if (point == 0) {
              path.moveTo(position.dx, position.dy);
            } else {
              path.lineTo(position.dx, position.dy);
            }
          }
          path.close();
          canvas.drawPath(path, paint);
      }
      canvas.restore();
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) => true;
}
