import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:okidoki/core/core.dart';
import 'package:okidoki/presentation/presentation.dart';

class ImagePicker extends StatefulWidget {
  const new({
    super.key,
    this.initialImage,
    this._diameter,
    this.onChanged,
    this.value,
  });

  final FileContent? value;
  final String? initialImage;
  final double? _diameter;
  final void Function(FileContent? img)? onChanged;

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  bool isHovered = false;

  void _onChanged(FileContent file) {
    widget.onChanged?.call(file);
  }

  @override
  Widget build(BuildContext context) {
    final maxDiameter = widget._diameter ?? 150;
    final borderRadius = 50;

    final outlineColor = context.appColors.bPrimary.border;

    final overlay = InkWell(
      onTap: () async {
        final result = await FilePicker.pickFiles(
          type: FileType.image,
        );
        if (result.length == 1) {
          Uint8List? img;
          String? filename;
          final selectedItem = result.first;
          if (kIsWeb) {
            img = await selectedItem.readAsBytes();
            filename = selectedItem.name;
          } else {
            File file = File(selectedItem.path!);
            img = await file.readAsBytes();
            filename = selectedItem.name;
          }
          _onChanged(
            FileContent(
              content: img,
              contentType: "application/octet-stream",
              fileName: filename,
            ),
          );
        }
      },
      onHover: (v) => setState(() => isHovered = v),
      child: ColoredBox(
        color: isHovered ? Color(0x30000000) : context.appColors.transparent,
        child: Align(
          child: Icon(
            Icons.add,
            size: 24,
            color: outlineColor,
          ),
        ),
      ),
    );

    Widget imageBuilder(double diameter, double br) => CustomPaint(
      size: Size.square(diameter),
      painter: DashedRectanglePainter(
        color: outlineColor,
        strokeWidth: 2,
        dashLength: 10,
        dashSpace: 10,
        radius: Radius.circular(br),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(br),
        child: Container(
          width: diameter,
          height: diameter,
          alignment: .center,
          decoration: BoxDecoration(
            image: widget.initialImage == null || widget.value != null
                ? null
                : DecorationImage(
                    image: NetworkImage(widget.initialImage!),
                    fit: .cover,
                  ),
          ),
          foregroundDecoration: BoxDecoration(
            color: Color(0x30000000),
            image: widget.value == null
                ? null
                : DecorationImage(
                    image: MemoryImage(widget.value!.content),
                    fit: .cover,
                  ),
          ),
          child: SizedBox.square(
            dimension: diameter,
            child: overlay,
          ),
        ),
      ),
    );

    final radius = maxDiameter;
    final br = borderRadius * 100 / radius;

    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox.square(
        dimension: radius,
        child: imageBuilder(radius, br),
      ),
    );
  }
}

class ImageFormPicker extends FormField<FileContent> {
  new({
    super.key,
    String? initialImage,
    double? radius,
    ValueChanged<FileContent?>? onChanged,
    super.onSaved,
    super.enabled = true,
  }) : super(
         initialValue: null,
         builder: (FormFieldState<FileContent> field) {
           void onChangedHandler(FileContent? value) {
             field.didChange(value);
             onChanged?.call(value);
           }

           return UnmanagedRestorationScope(
             bucket: field.bucket,
             child: ImagePicker(
               initialImage: initialImage,
               onChanged: onChangedHandler,
               diameter: radius,
               value: field.value,
             ),
           );
         },
       );
}

class DashedRectanglePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;
  final Radius radius;

  DashedRectanglePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.dashSpace,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();
    // Tworzymy ścieżkę standardowego prostokąta
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        radius,
      ),
    );

    // Rysujemy ścieżkę jako linię przerywaną
    for (final metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double nextDistance = distance + dashLength;
        canvas.drawPath(
          metric.extractPath(
            distance,
            nextDistance < metric.length ? nextDistance : metric.length,
          ),
          paint,
        );
        distance = nextDistance + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
