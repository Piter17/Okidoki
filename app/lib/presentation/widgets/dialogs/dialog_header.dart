import 'package:riv/presentation/presentation.dart';

class DialogHeader extends StatefulWidget {
  const DialogHeader({
    super.key,
    this.centerText = true,
    required this.text,
  });

  final bool centerText;
  final String text;

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
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        ...widget.centerText
            ? [
                SizedBox(width: calculatedWidth),
                Center(
                  child: Text(widget.text),
                ),
              ]
            : [Text(widget.text)],
        IconButton(
          key: measuredWidgetKey,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}
