import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:riv/presentation/presentation.dart';

class const DropdownEntry<T>({
  super.key,
  required super.text,
  required super.value,
  super.subText,
  required final Map<T, String> possibleValues,
  required super.onItemSelected,
}) extends BaseDropdownEntry<T> {
  @override
  ContextMenu<T> getContextMenu(BuildContext context) {
    return ContextMenu(
      entries: possibleValues.entries
          .map(
            (x) => MenuItem(
              value: x.key,
              label: Text(x.value),
              icon: Icon(Icons.radio_button_checked),
            ),
          )
          .toList(),
    );
  }
}

class const DropdownEntryAlt<T>({
  super.key,
  required super.text,
  required super.value,
  super.subText,
  required final String Function(T item) getLabel,
  required final List<T> items,
  required super.onItemSelected,
}) extends BaseDropdownEntry<T> {
  @override
  ContextMenu<T> getContextMenu(BuildContext context) => ContextMenu(
    entries: items
        .map(
          (x) => MenuItem(
            value: x,
            label: Text(getLabel(x)),
            icon: Icon(Icons.radio_button_checked),
          ),
        )
        .toList(),
  );
}

abstract class BaseDropdownEntry<T> extends HookWidget {
  final Widget text;
  final Widget? subText;
  final ValueChanged<T?>? onItemSelected;
  final T? value;

  const new({
    super.key,
    required this.text,
    this.value,
    this.subText,
    this.onItemSelected,
  });

  ContextMenu<T> getContextMenu(BuildContext context);

  @override
  Widget build(BuildContext context) {
    /// TODO LMB Dropdown
    return ContextMenuRegion(
      onItemSelected: onItemSelected,
      contextMenu: getContextMenu(context),
      child: Entry(
        text: text,
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
