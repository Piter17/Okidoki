import 'package:okidoki/presentation/presentation.dart';

class const DialogHeader({
  super.key,
  final bool centerText = true,
  required final String text,
  final bool showCloseButton = true,
}) extends StatefulWidget {
  @override
  State<DialogHeader> createState() => _DialogHeaderState();
}

class _DialogHeaderState extends State<DialogHeader> {
  final GlobalKey measuredWidgetKey = GlobalKey();
  double calculatedWidth = 0;

  void measure() {
    final ctx = measuredWidgetKey.currentContext;
    if (ctx == null) return;

    final ro = ctx.findRenderObject();
    if (ro is RenderBox && ro.hasSize) {
      final w = ro.size.width;
      if (w != calculatedWidth) {
        setState(() => calculatedWidth = w);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.centerText == false) return;
    WidgetsBinding.instance.addPostFrameCallback((_) => measure());
  }

  @override
  void didUpdateWidget(covariant DialogHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.centerText == false) return;
    WidgetsBinding.instance.addPostFrameCallback((_) => measure());
  }

  @override
  Widget build(BuildContext context) {
    final text = Text(
      widget.text,
      style: context.fonts.subtitle1,
    );
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        ...widget.centerText
            ? [
                SizedBox(width: calculatedWidth),
                Center(child: text),
              ]
            : [
                Padding(
                  padding: context.values.containerPaddingXL.only(left: true),
                  child: text,
                ),
              ],
        if (widget.showCloseButton)
          IconButton(
            key: measuredWidgetKey,
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
          ),
      ],
    );
  }
}
