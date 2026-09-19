import 'package:riv/presentation/presentation.dart';

class const IsDirtyBar({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final popCanceled = IsDirtyHandler.of(context).popCanceled;
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 50, bottom: 50, right: 50),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 200,
            maxWidth: 500,
          ),
          child: Surface(
            decoration: BoxDecoration(
              color: popCanceled
                  ? context.appColors.danger.color
                  : context.palette.background,
            ),
            height: 60,
            child: Padding(
              padding: context.values.containerPadding,
              child: Row(
                children: [
                  Text(context.s.dirty_changes),
                  Spacer(),
                  Button(
                    buttonType: .text,
                    onPressed: BaseSettingsScreen.maybeOf(context)?.reset,
                    child: Text(context.s.generic_discard),
                  ),
                  Button(
                    buttonType: .primary,
                    onPressed: BaseSettingsScreen.maybeOf(context)?.save,
                    child: Text(context.s.generic_save),
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
