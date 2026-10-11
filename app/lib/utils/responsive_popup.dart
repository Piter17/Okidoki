import 'package:okidoki/presentation/presentation.dart';

Future<T?> showResponsivePopup<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  BoxConstraints? dialogConstraints = const BoxConstraints(
    maxWidth: 720,
    maxHeight: 900,
    minHeight: 350,
    minWidth: 360,
  ),
  bool? showDragHandle,
  bool dismissible = true,
}) {
  if (LayoutType.fromContext(context) == LayoutType.phone) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: context.appColors.transparent,
      // showDragHandle: showDragHandle,
      constraints: dialogConstraints,
      builder: (c) => GlassSurface(
        asDialog: false,
        child: builder(c),
      ),
    );
  }

  return showDialog<T>(
    context: context,
    barrierDismissible: dismissible,
    builder: (context) => GlassDialog(
      constraints: dialogConstraints,
      child: builder(context),
    ),
  );
}
