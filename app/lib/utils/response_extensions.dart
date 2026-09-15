import 'package:dio/dio.dart';

extension ResponseExtensions<T> on Response<T> {
  bool get isSuccess => statusCode != null ? statusCode! ~/ 100 == 2 : false;
}
