import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';

class const ErrorDialog({
  super.key,
  required final String text,
  required final String title,
}) extends StatelessWidget {
  static Future<void> showError({
    required BuildContext context,
    required dynamic error,
  }) {
    return switch (error) {
      ApiException e => _show(
        context: context,
        error: e.error.toString(),
        title: e.title,
      ),
      _ => _show(context: context, error: error.toString()),
    };
  }

  static Future<void> show({
    required BuildContext context,
    required String error,
    String? title,
  }) => _show(context: context, error: error, title: title);

  static Future<void> _show({
    required BuildContext context,
    required String error,
    String? title,
  }) {
    final resolvedTitle = title ?? S.of(context)!.generic_error;
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        // insetPadding: .all(40),
        constraints: BoxConstraints(
          maxWidth: 360,
          maxHeight: 350,
        ),
        child: ErrorDialog(
          text: error,
          title: resolvedTitle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Surface(
      variant: .popup,
      borderRadius: context.values.borderL,
      child: Column(
        children: [
          DialogHeader(text: title),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: context.values.containerPaddingL,
                child: SelectionArea(child: Text(text)),
              ),
            ),
          ),
          Padding(
            padding: context.values.containerPaddingL,
            child: Align(
              alignment: .centerRight,
              child: Button(
                buttonType: .primary,
                onPressed: () => Navigator.of(context).pop(),
                child: Text(context.s.generic_close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
