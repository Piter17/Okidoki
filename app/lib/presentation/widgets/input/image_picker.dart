import 'dart:io';

import 'package:darq/darq.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';

class ImagePicker extends StatefulWidget {
  const new({
    super.key,
    this.initialImage,
    this._radius,
    this.onChanged,
    this.value,
  });

  final FileContent? value;
  final String? initialImage;
  final double? _radius;
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
    final maxRadius = widget._radius ?? 150;
    final borderRadius = BorderRadiusGeometry.circular(50);

    return Align(
      child: LayoutBuilder.constraints(
        builder: (context, constraints) {
          final radius = [
            constraints.maxHeight,
            constraints.maxWidth,
            maxRadius,
          ].min();
          final br = borderRadius * 100 / radius;
          return Container(
            width: radius,
            height: radius,
            alignment: .center,
            decoration: BoxDecoration(
              image: widget.initialImage == null || widget.value != null
                  ? null
                  : DecorationImage(
                      image: NetworkImage(widget.initialImage!),
                      fit: .cover,
                    ),
              borderRadius: br,
            ),
            foregroundDecoration: widget.value == null
                ? null
                : BoxDecoration(
                    borderRadius: br,
                    image: DecorationImage(
                      image: MemoryImage(widget.value!.content),
                      fit: .cover,
                    ),
                    color: Color(0x30000000),
                  ),
            child: InkWell(
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
              child: isHovered
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: br,
                        color: Color(0x30000000),
                      ),
                      child: Align(
                        child: Container(
                          padding: .all(4),
                          child: IconButton(
                            icon: Icon(
                              Icons.plus_one,
                            ),
                            highlightColor: Color(0x60000000),

                            iconSize: 24,
                            color: Color(0xffffffff),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          );
        },
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
               radius: radius,
               value: field.value,
             ),
           );
         },
       );
}
