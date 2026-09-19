import 'package:flutter/gestures.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:riv/presentation/presentation.dart';

typedef GetLabel<T> = String? Function(T? item);

class const DropdownEntry<T>({
  super.key,
  required super.text,
  required super.value,
  super.subText,
  required final Map<T, String> possibleValues,
  required super.onItemSelected,
  super.getLabel,
}) extends BaseDropdownEntry<T> {
  @override
  String _getLabel(T? item) {
    return getLabel?.call(item) ?? possibleValues[item] ?? "";
  }

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
  required GetLabel<T> getLabel,
  required final List<T> items,
  required super.onItemSelected,
}) extends BaseDropdownEntry<T> {
  this : super(getLabel: getLabel);
  @override
  ContextMenu<T> getContextMenu(BuildContext context) => ContextMenu(
    entries: items
        .map(
          (x) => MenuItem(
            value: x,
            label: Text(_getLabel(x)),
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
  final GetLabel<T>? getLabel;

  const new({
    super.key,
    required this.text,
    required this.getLabel,
    this.value,
    this.subText,
    this.onItemSelected,
  });

  ContextMenu<T> getContextMenu(BuildContext context);
  String _getLabel(T? item) => item == null ? "" : getLabel!.call(item) ?? "";

  @override
  Widget build(BuildContext context) {
    return ContextMenuRegion(
      onItemSelected: onItemSelected,
      contextMenu: getContextMenu(context),
      builder: (context, contextMenu, pointerPosition, showMenu, child) =>
          Listener(
            onPointerDown: (event) {
              if (event.buttons == kPrimaryButton) {
                showMenu(event.position);
              }
            },
            child: child,
          ),
      child: Entry(
        text: text,
        onTap: () {},
        subText: subText,
        child: Button.icon(
          buttonType: .text,
          icon: Icon(Icons.arrow_drop_down),
          label: Text(_getLabel(value)),
          onPressed: null,
        ),
      ),
    );
  }
}
