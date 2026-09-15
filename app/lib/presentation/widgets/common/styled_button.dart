import 'dart:async';

import 'package:riv/presentation/presentation.dart';

enum ButtonType {
  primary,
  secondary,
  text,
  textRadio,
  textRadioOn;

  ButtonStyle? style(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.colors;

    ButtonStyle? getTextRadio() => theme.textButtonTheme.style?.copyWith(
      foregroundColor: WidgetStateColor.resolveWith(
        (states) => colors.body.text,
      ),
    );

    ButtonStyle? getTextRadioOn() => getTextRadio()?.copyWith(
      textStyle: WidgetStatePropertyAll(context.fonts.bodyStronger),
      backgroundColor: WidgetStateColor.resolveWith(
        (_) => context.colors.borderTranslucent,
      ),
    );

    final style = switch (this) {
      ButtonType.primary => theme.filledButtonTheme.style,
      ButtonType.secondary => theme.outlinedButtonTheme.style,
      ButtonType.text => theme.textButtonTheme.style,
      ButtonType.textRadio => getTextRadio(),
      ButtonType.textRadioOn => getTextRadioOn(),
    };
    return style;
  }
}

class Button extends StatefulWidget {
  final FutureOr Function()? onPressed;
  final FutureOr Function()? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final WidgetStatesController? statesController;
  final bool? isSemanticButton;
  final Widget? child_;
  final ButtonType buttonType;

  final Widget? icon;
  final IconAlignment? iconAlignment;
  final Widget? label;

  const Button({
    super.key,
    this.buttonType = .primary,
    required this.onPressed,
    required Widget child,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.statesController,
    this.isSemanticButton = true,
  }) : child_ = child,
       icon = null,
       iconAlignment = null,
       label = null;

  const Button.icon({
    super.key,
    required this.buttonType,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.statesController,
    this.isSemanticButton = true,
    this.iconAlignment,
  }) : child_ = null;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    if (widget.icon != null) {
      return switch (widget.buttonType) {
        ButtonType.primary => ElevatedButton.icon(
          key: widget.key,
          onPressed: widget.onPressed, //getOnPressed(isRunning),
          onLongPress: widget.onLongPress, //getOnLongPress(isRunning),
          onHover: widget.onHover,
          onFocusChange: widget.onFocusChange,
          style: widget.buttonType.style(context),
          clipBehavior: widget.clipBehavior,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          statesController: widget.statesController,
          icon: widget.icon,
          label: widget.label!,
          iconAlignment: widget.iconAlignment,
        ),
        ButtonType.secondary => OutlinedButton.icon(
          key: widget.key,
          onPressed: widget.onPressed, //getOnPressed(isRunning),
          onLongPress: widget.onLongPress, //getOnLongPress(isRunning),
          onHover: widget.onHover,
          onFocusChange: widget.onFocusChange,
          style: widget.buttonType.style(context),
          clipBehavior: widget.clipBehavior,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          statesController: widget.statesController,
          icon: widget.icon,
          label: widget.label!,
          iconAlignment: widget.iconAlignment,
        ),
        ButtonType.text ||
        ButtonType.textRadio ||
        ButtonType.textRadioOn => TextButton.icon(
          key: widget.key,
          onPressed: widget.onPressed, //getOnPressed(isRunning),
          onLongPress: widget.onLongPress, //getOnLongPress(isRunning),
          onHover: widget.onHover,
          onFocusChange: widget.onFocusChange,
          style: widget.buttonType.style(context),
          clipBehavior: widget.clipBehavior,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          statesController: widget.statesController,
          icon: widget.icon,
          label: widget.label!,
          iconAlignment: widget.iconAlignment,
        ),
      };
    }
    return switch (widget.buttonType) {
      ButtonType.primary => FilledButton(
        key: widget.key,
        onPressed: widget.onPressed, //getOnPressed(isRunning),
        onLongPress: widget.onLongPress, //getOnLongPress(isRunning),
        onHover: widget.onHover,
        onFocusChange: widget.onFocusChange,
        style: widget.buttonType.style(context),
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        statesController: widget.statesController,
        child: widget.child_,
      ),
      ButtonType.secondary => OutlinedButton(
        key: widget.key,
        onPressed: widget.onPressed, //getOnPressed(isRunning),
        onLongPress: widget.onLongPress, //getOnLongPress(isRunning),
        onHover: widget.onHover,
        onFocusChange: widget.onFocusChange,
        style: widget.buttonType.style(context),
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        statesController: widget.statesController,
        child: widget.child_,
      ),
      ButtonType.text => TextButton(
        key: widget.key,
        onPressed: widget.onPressed, //getOnPressed(isRunning),
        onLongPress: widget.onLongPress, //getOnLongPress(isRunning),
        onHover: widget.onHover,
        onFocusChange: widget.onFocusChange,
        style: widget.buttonType.style(context),
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        statesController: widget.statesController,
        isSemanticButton: widget.isSemanticButton,
        child: widget.child_!,
      ),
      _ => throw 'incorrect buttonType',
    };
  }
}
