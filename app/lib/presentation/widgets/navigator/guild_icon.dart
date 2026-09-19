import 'dart:math';

import 'package:api_bindings/api_bindings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';

class GuildIcon extends HookConsumerWidget {
  const new({
    super.key,
    required this.guildProfile,
    required this.isSelected,
  }) : isSkeleton = false;

  const new skeleton({super.key})
    : guildProfile = null,
      isSelected = false,
      isSkeleton = true;

  final GuildProfileDto? guildProfile;
  final bool isSelected;
  final bool isSkeleton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hovered = useState(false);
    final img = guildProfile?.image;

    return Skeletonizer(
      enabled: isSkeleton,
      child:
          NavigatorBaseItem(
            image: img,
            isSelected: isSelected,
            onTap: guildProfile == null
                ? null
                : () => ref
                      .read(chatNavigationProvider.notifier)
                      .openGuild(guildProfile!.id),
            onHover: hovered.set,
          ).wrapIf(
            guildProfile != null,
            (x) => Tooltip(
              message: guildProfile!.name,
              child: GuildIconContextMenu(guild: guildProfile!, child: x),
            ),
          ),
    );
  }
}

class SelectedGuildIndicator extends StatelessWidget {
  final Widget child;
  final bool isSelected;

  const SelectedGuildIndicator({
    super.key,
    required this.child,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final height = context.values.spacing;
    final width = height / 2;
    return Row(
      crossAxisAlignment: .center,
      mainAxisSize: .min,
      spacing: context.values.spacingS,
      children: [
        CustomPaint(
          painter: isSelected == false
              ? null
              : SemicirclePainter(color: context.palette.hover),
          size: Size(width, height),
        ),
        child,
        Space(space: width),
      ],
    );
  }
}

class DMIcon extends StatelessWidget {
  final int? unreadItems;
  final bool isSelected;

  const DMIcon({super.key, this.unreadItems, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return NavigatorBaseItem.custom(
          isSelected: isSelected,
          onTap: () => ref.read(chatNavigationProvider.notifier).openFriends(),
          backgroundColor: context.palette.tone,
          // backgroundColor: context.appColors.surfaceTonal.background,
          badgeText: unreadItems != null && unreadItems! > 0
              ? unreadItems.toString()
              : null,
          child: SvgPicture.asset(Assets.images.logo),
        );
      },
    );
  }
}

class AddGuildIcon extends StatelessWidget {
  const AddGuildIcon({super.key});

  @override
  Widget build(BuildContext context) => NavigatorBaseItem.custom(
    backgroundColor: context.palette.hover,
    onTap: () => AddGuildPage.open(context),
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context.palette.border,
        borderRadius: .circular(40),
      ),
      child: Icon(Icons.add),
    ),
  );
}

class NavigatorBaseItem extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onSecondaryTap;
  // final void Function()? onTertiaryTap;
  final double size;
  final String? badgeText;
  final String? image;
  final Widget? child;
  final String? name;
  final Color? backgroundColor;
  final ValueChanged<bool>? onHover;
  final bool? isSelected;

  const new({
    super.key,
    this.isSelected = false,
    this.onTap,
    this.onSecondaryTap,
    this.size = 40,
    this.badgeText,
    this.image,
    this.name,
    this.backgroundColor,
    this.onHover,
  }) : child = null;

  const new custom({
    super.key,
    this.isSelected = false,
    this.onTap,
    this.onSecondaryTap,
    this.size = 40,
    this.badgeText,
    this.name,
    this.backgroundColor,
    this.onHover,
    required Widget this.child,
  }) : image = null;

  @override
  Widget build(BuildContext context) {
    final av =
        child ??
        CircleAvatar(
          backgroundImage: image?.mapOr(NetworkImage.new),
          backgroundColor: backgroundColor,
          radius: size,
        );

    // final item = SizedBox(
    //   width: size,
    //   height: size,
    //   child: av.wrapIf(
    //     badgeText != null,
    //     (x) => CustomPaint(
    //       size: Size.square(size),
    //       painter: BadgePainter(color: Color(0xff863451), text: badgeText!),
    //       child: x,
    //     ),
    //   ),
    //   // child: badgeText == null
    //   //     ? av
    //   //     : Badge(
    //   //         label: Text(badgeText!),
    //   //         alignment: Alignment.bottomRight,
    //   //         offset: Offset(-2 / 64 * size, -22 / 64 * size),
    //   //         child: av,
    //   //       ),
    // );

    return SelectedGuildIndicator(
      isSelected: isSelected == true,
      child: InkResponse(
        onTap: onTap,
        onSecondaryTap: onSecondaryTap,
        onHover: onHover,
        child: InputDetector(
          child: SizedBox(
            width: size,
            height: size,
            child: CustomPaint(
              size: Size.square(size),
              foregroundPainter: BadgePainter(
                color: context.appColors.primary.color,
                text: badgeText,
                textStyle: context.fonts.caption1Stronger.withColor(
                  context.appColors.bSecondary.background,
                ),
              ),
              child: av,
            ),
          ),
        ),
      ),
    );
  }
}

class SemicirclePainter extends CustomPainter {
  final Color color;

  new({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // final rect = Rect.fromLTWH(size.width / 2, 0, size.width, size.height);
    // canvas.drawParagraph(, offset)
    // canvas.drawArc(rect, 1.5 * pi, pi, false, paint);
    canvas.drawCircle(Offset(0, size.height / 2), size.width, paint);
  }

  @override
  bool shouldRepaint(SemicirclePainter oldDelegate) => false;
}

class BadgePainter extends CustomPainter {
  final Color color;
  final String? text;
  final TextStyle textStyle;

  new({
    super.repaint,
    required this.color,
    required this.text,
    required this.textStyle,
  });
  @override
  void paint(Canvas canvas, Size size) {
    if (text == null) return;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      text: TextSpan(
        text: text!,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.layout(maxWidth: size.width);

    final scaleFactor = 5;
    // final radius = size.height / scaleFactor;

    final offset = size.center(Offset.fromDirection(pi * .25, size.width * .5));
    final textOffset =
        offset - Offset(textPainter.width, textPainter.height) / 2;
    // size.center(Offset.zero);
    //   Offset(
    //     (textPainter.width) / 2,
    //     (textPainter.height) / 2,
    //   ),
    // );

    canvas.drawCircle(offset, size.height / scaleFactor, paint);
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(BadgePainter oldDelegate) => false;
}
