import 'dart:ui';

import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';

class const BaseTopBar({
  super.key,
  final bool isLoading = false,
  final Widget? prefixIcon,
  final Widget? title,
  final void Function()? titleOnTap,
  final List<Widget>? actions,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final hovered = useState(false);
    return IconTheme.merge(
      data: IconThemeData(size: context.values.iconSizeXL),
      child: DefaultTextStyle.merge(
        style: context.fonts.subtitle2Stronger,
        child:
            Padding(
              padding: context.values.topBarPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ?prefixIcon,
                  if (prefixIcon != null && title != null) Space(),
                  if (title != null)
                    InkWell(
                      onTap: titleOnTap,
                      onHover: hovered.set,
                      child: title!,
                    ),
                  Spacer(),
                  if (actions != null)
                    Row(
                      crossAxisAlignment: .center,
                      spacing: context.values.spacing,
                      children: actions!,
                    ),
                ],
              ),
            ).wrapIf(
              false,
              (child) => ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: child,
                ),
              ),
            ),
      ),
    ).wrapIf(isLoading, (x) => Skeletonizer(child: x));
  }
}
