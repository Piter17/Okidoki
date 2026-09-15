import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:riv/presentation/presentation.dart';

class DropdownEntry<T> extends StatelessWidget {
  final Widget text;
  final Widget? subText;
  final T? value;
  final void Function(T?)? onChanged;
  final Map<T, String> possibleValues;
  final ValueChanged<T?>? onItemSelected;

  const new({
    super.key,
    required this.text,
    required this.value,
    this.subText,
    this.onChanged,
    required this.possibleValues,
    required this.onItemSelected,
  });

  /// TODO List constructor with item builder

  // const new list({
  //   super.key,
  //   required this.text,
  //   required this.value,
  //   this.subText,
  //   this.onChanged,
  //   required this.possibleValues,
  //   required this.onItemSelected,
  // });

  @override
  Widget build(BuildContext context) {
    /// TODO LMB Dropdown
    return ContextMenuRegion(
      onItemSelected: onItemSelected,
      contextMenu: ContextMenu(
        entries: possibleValues.entries
            .map(
              (x) => MenuItem(
                value: x.key,
                label: Text(x.value),
                icon: Icon(Icons.radio_button_checked),
              ),
            )
            .toList(),
      ),
      child: Entry(
        text: text,
        // onTap: onChanged == null ? null : () => onChanged!(!value),
        onTap: () {},
        subText: subText,
        child: Button.icon(
          buttonType: .text,
          icon: Icon(Icons.arrow_drop_down),
          label: Text(context.s.generic_color),
          onPressed: () {},
        ),
      ),
    );
  }
}
