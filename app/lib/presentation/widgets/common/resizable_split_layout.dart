import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';

class ResizableSplitLayout extends ConsumerStatefulWidget {
  const ResizableSplitLayout({
    super.key,
    this.initialLeftWidth = 300,
    this.minLeftWidth = 250,
    this.maxLeftWidth = 400,
    this.dividerWidth = 2,
    this.viewKey,
    required this.leftChild,
    required this.rightChild,
  });

  /// Used for saving width
  final String? viewKey;

  final double initialLeftWidth;
  final double minLeftWidth;
  final double? maxLeftWidth;
  final double dividerWidth;

  final Widget leftChild;
  final Widget rightChild;

  @override
  ConsumerState<ResizableSplitLayout> createState() =>
      _ResizableSplitViewState();
}

class _ResizableSplitViewState extends ConsumerState<ResizableSplitLayout> {
  late double _leftWidth = widget.viewKey == null
      ? widget.initialLeftWidth
      : ref.read(appSettingsProvider).navigatorWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder.constraints(
      builder: (context, constraints) {
        final totalW = constraints.maxWidth;

        final effectiveMaxLeft =
            widget.maxLeftWidth ??
            (totalW - widget.minLeftWidth - widget.dividerWidth);

        _leftWidth = _leftWidth.clamp(
          widget.minLeftWidth,
          effectiveMaxLeft.clamp(widget.minLeftWidth, double.infinity),
        );

        return Row(
          children: [
            SizedBox(
              width: _leftWidth,
              child: widget.leftChild,
            ),

            Container(
              color: context.colors.border,
              width: widget.dividerWidth,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragEnd: (details) {
                    if (widget.viewKey != null) {
                      ref
                          .read(appSettingsProvider.notifier)
                          .setNavigatorWidth(_leftWidth);
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    final dx = details.delta.dx;

                    setState(() {
                      _leftWidth = (_leftWidth + dx).clamp(
                        widget.minLeftWidth,
                        effectiveMaxLeft,
                      );
                    });
                  },
                ),
              ),
            ),

            Expanded(child: widget.rightChild),
          ],
        );
      },
    );
  }
}
