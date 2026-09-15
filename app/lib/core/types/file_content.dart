import 'dart:typed_data';

import 'package:dio/dio.dart';

class FileContent {
  final Uint8List content;
  final String contentType;
  final String? fileName;

  const FileContent({
    required this.content,
    required this.contentType,
    required this.fileName,
  });

  MultipartFile toDio() => MultipartFile.fromBytes(
    content,
    filename: fileName,
    contentType: DioMediaType.parse(contentType),
  );
}
