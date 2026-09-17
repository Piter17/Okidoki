import 'package:riv/presentation/presentation.dart';

Future<T?> showResponsivePopup<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  BoxConstraints dialogConstraints = const BoxConstraints(
    maxWidth: 1500,
    maxHeight: 900,
    minHeight: 350,
    minWidth: 360,
  ),
  WidgetBuilder? bottomSheetBuilder,
  WidgetBuilder? dialogBuilder,
  bool? showDragHandle,
}) {
  if (LayoutType.fromContext(context) == LayoutType.phone) {
    return showModalBottomSheet<T>(
      context: context,
      showDragHandle: showDragHandle,
      builder: bottomSheetBuilder ?? builder,
    );
  }

  Widget effectiveDialogBuilder(BuildContext context) {
    return Dialog(
      constraints: dialogConstraints,
      child: builder(context),
    );
  }

  return showDialog<T>(
    context: context,
    builder: dialogBuilder ?? effectiveDialogBuilder,
  );
}
