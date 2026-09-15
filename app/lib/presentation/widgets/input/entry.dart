import 'package:flutter/material.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';

class Entry extends HookWidget {
  final Widget text;
  final Widget? subText;
  final bool enabled;

  final Widget child;

  final void Function()? onTap;

  const new({
    super.key,
    required this.text,
    this.subText,
    this.onTap,
    this.enabled = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    return InkWell(
      onTap: enabled ? onTap ?? () {} : null,
      onHover: isHovered.set,
      child: AnimatedContainer(
        duration: Durations.medium1,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: enabled && isHovered.value ? context.colors.hoverColor : null,
          borderRadius: context.values.borderL,
        ),
        padding: context.values.entryPadding,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: subText != null ? .start : .center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  DefaultTextStyle.merge(
                    style: context.fonts.bodyStrong,
                    overflow: .ellipsis,
                    child: text,
                  ),
                  if (subText != null)
                    DefaultTextStyle.merge(
                      style: context.fonts.caption1,
                      maxLines: 10,
                      overflow: .clip,
                      child: subText!,
                    ),
                ],
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
