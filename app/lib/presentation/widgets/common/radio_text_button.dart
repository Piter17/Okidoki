// import 'dart:ui';

//

// class RadioTextButton<T> extends StatefulWidget {
//   const RadioTextButton({
//     required this.value,
//     super.key,
//     this.icon,
//     this.iconAlignment,
//     required this.label,
//     this.semanticLabel,
//     this.focusNode,
//     this.autofocus = false,
//     this.enabled = true,
//     this.groupRegistry,
//     this.buttonStyle,
//   });

//   /// Whether this radio button is checked.
//   final T value;

//   final Widget label;

//   final Widget? icon;

//   final IconAlignment? iconAlignment;

//   /// {@macro fluent_ui.controls.inputs.HoverButton.semanticLabel}
//   final String? semanticLabel;

//   /// {@macro flutter.widgets.Focus.focusNode}
//   final FocusNode? focusNode;

//   /// {@macro flutter.widgets.Focus.autofocus}
//   final bool autofocus;

//   /// Whether this radio button is enabled.
//   final bool enabled;

//   /// {@macro flutter.widget.RawRadio.groupRegistry}
//   final RadioGroupRegistry<T>? groupRegistry;

//   final ButtonStyle? buttonStyle;

//   @override
//   State<RadioTextButton<T>> createState() => _RadioTextButtonState<T>();
// }

// class _RadioTextButtonState<T> extends State<RadioTextButton<T>> {
//   FocusNode? _internalFocusNode;
//   FocusNode get _focusNode {
//     if (widget.focusNode != null) return widget.focusNode!;
//     _internalFocusNode ??= FocusNode();
//     return _internalFocusNode!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RawRadio(
//       value: widget.value,
//       mouseCursor: const WidgetStatePropertyAll(MouseCursor.defer),
//       toggleable: false,
//       focusNode: _focusNode,
//       autofocus: widget.autofocus,
//       groupRegistry: widget.groupRegistry ?? RadioGroup.maybeOf<T>(context),
//       enabled: widget.enabled,
//       builder: (context, state) {
//         final checked = state.states.contains(WidgetState.selected);
//         // final decoration =
//         //     (checked
//         //         ? style.checkedDecoration?.resolve(state.states)
//         //         : style.uncheckedDecoration?.resolve(state.states)) ??
//         //     const BoxDecoration(shape: BoxShape.circle);

//         // return Semantics(
//         //   checked: checked,
//         //   child: Container(
//         //     width: 24,
//         //     height: 24,
//         //     color: checked ? Color(0xff00ff00) : Color(0xffff0000),
//         //   ),
//         // );

//         return Semantics(
//           checked: checked,
//           child:
//               widget.icon != null
//                   ? _TextButtonWithIcon(
//                     buttonStyle: null,
//                     icon: widget.icon!,
//                     iconAlignment: widget.iconAlignment,
//                     label: widget.label,
//                   )
//                   : widget.label,
//         );
//       },
//     );
//   }
// }

// class _ButtonWithIcon extends StatelessWidget {
//   const _ButtonWithIcon({
//     required this.label,
//     required this.icon,
//     required this.buttonStyle,
//     required this.iconAlignment,
//   });

//   final Widget label;
//   final Widget icon;
//   final ButtonStyle? buttonStyle;
//   final IconAlignment? iconAlignment;

//   @override
//   Widget build(BuildContext context) {
//     final double defaultFontSize =
//         buttonStyle?.textStyle?.resolve(const <WidgetState>{})?.fontSize ??
//         14.0;
//     final double scale =
//         clampDouble(
//           MediaQuery.textScalerOf(context).scale(defaultFontSize) / 14.0,
//           1.0,
//           2.0,
//         ) -
//         1.0;
//     final TextButtonThemeData textButtonTheme = TextButtonTheme.of(context);
//     final IconAlignment effectiveIconAlignment =
//         iconAlignment ??
//         textButtonTheme.style?.iconAlignment ??
//         buttonStyle?.iconAlignment ??
//         IconAlignment.start;
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       spacing: lerpDouble(8, 4, scale)!,
//       children:
//           effectiveIconAlignment == IconAlignment.start
//               ? <Widget>[icon, Flexible(child: label)]
//               : <Widget>[Flexible(child: label), icon],
//     );
//   }
// }
