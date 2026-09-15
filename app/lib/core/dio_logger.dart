import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const _timeStampKey = '_pdl_timeStamp_';

/// A pretty logger for Dio
/// it will print request/response info with a pretty format
/// and also can filter the request/response by [RequestOptions]
class DioLogger extends Interceptor {
  /// Print request [Options]
  final bool request;

  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print request data [Options.data]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print error message
  final bool error;

  /// InitialTab count to logPrint json response
  static const int kInitialTab = 1;

  /// 1 tab length
  static const String tabStep = '    ';

  /// Print compact json response
  final bool compact;

  /// Width size per logPrint
  final int maxWidth;

  /// Size in which the Uint8List will be split
  static const int chunkSize = 20;

  /// Filter request/response by [RequestOptions]
  final bool Function(RequestOptions options, FilterArgs args)? filter;

  /// Enable logPrint
  final bool enabled;

  /// Default constructor
  DioLogger({
    this.request = true,
    this.requestHeader = false,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.maxWidth = 90,
    this.compact = true,
    this.filter,
    this.enabled = true,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final extra = Map.of(options.extra);
    options.extra[_timeStampKey] = DateTime.timestamp().millisecondsSinceEpoch;

    if (!enabled ||
        (filter != null &&
            !filter!(options, FilterArgs(false, options.data)))) {
      handler.next(options);
      return;
    }

    LogPrinter.block(
      maxWidth: maxWidth,
      printFunction: debugPrint,
      func: (printer) {
        if (request) {
          printer.printRequestHeader(options);
        }
        if (requestHeader) {
          printer.printMapAsTable(
            options.queryParameters,
            header: 'Query Parameters',
          );
          final requestHeaders = <String, dynamic>{};
          requestHeaders.addAll(options.headers);
          if (options.contentType != null) {
            requestHeaders['contentType'] = options.contentType?.toString();
          }
          requestHeaders['responseType'] = options.responseType.toString();
          requestHeaders['followRedirects'] = options.followRedirects;
          if (options.connectTimeout != null) {
            requestHeaders['connectTimeout'] = options.connectTimeout
                ?.toString();
          }
          if (options.receiveTimeout != null) {
            requestHeaders['receiveTimeout'] = options.receiveTimeout
                ?.toString();
          }
          printer.printMapAsTable(requestHeaders, header: 'Headers');
          printer.printMapAsTable(extra, header: 'Extras');
        }
        if (requestBody && options.method != 'GET') {
          final dynamic data = options.data;
          if (data != null) {
            if (data is Map) {
              printer.printMapAsTable(options.data as Map?, header: 'Body');
            }
            if (data is FormData) {
              final formDataMap = <String, dynamic>{}
                ..addEntries(data.fields)
                ..addEntries(data.files);
              printer.printMapAsTable(
                formDataMap,
                header: 'Form data | ${data.boundary}',
              );
            } else {
              printer.printBlock(data.toString());
            }
          }
        }
      },
    );
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!enabled ||
        (filter != null &&
            !filter!(
              err.requestOptions,
              FilterArgs(true, err.response?.data),
            ))) {
      handler.next(err);
      return;
    }

    final triggerTime = err.requestOptions.extra[_timeStampKey];

    LogPrinter.block(
      maxWidth: maxWidth,
      printFunction: debugPrint,
      func: (printer) {
        if (error) {
          if (err.type == DioExceptionType.badResponse) {
            final uri = err.response?.requestOptions.uri;
            int diff = 0;
            if (triggerTime is int) {
              diff = DateTime.timestamp().millisecondsSinceEpoch - triggerTime;
            }
            printer.printBoxed(
              header:
                  'DioError ║ Status: ${err.response?.statusCode} ${err.response?.statusMessage} ║ Time: $diff ms',
              text: uri.toString(),
            );
            if (err.response != null && err.response?.data != null) {
              printer.writeln('╔ ${err.type.toString()}');
              printer.printResponse(err.response!);
            }
            printer.printLine('╚');
            printer.writeln('');
          } else {
            printer.printBoxed(
              header: 'DioError ║ ${err.type}',
              text: err.message,
            );
          }
        }
      },
    );
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!enabled ||
        (filter != null &&
            !filter!(
              response.requestOptions,
              FilterArgs(true, response.data),
            ))) {
      handler.next(response);
      return;
    }

    LogPrinter.block(
      maxWidth: maxWidth,
      printFunction: debugPrint,
      func: (printer) {
        final triggerTime = response.requestOptions.extra[_timeStampKey];

        int diff = 0;
        if (triggerTime is int) {
          diff = DateTime.timestamp().millisecondsSinceEpoch - triggerTime;
        }
        printer.printResponseHeader(response, diff);
        if (responseHeader) {
          final responseHeaders = <String, String>{};
          response.headers.forEach(
            (k, list) => responseHeaders[k] = list.toString(),
          );
          printer.printMapAsTable(responseHeaders, header: 'Headers');
        }

        if (responseBody) {
          printer.writeln('╔ Body');
          printer.writeln('║');
          printer.printResponse(response);
          printer.writeln('║');
          printer.writeln('╚');
        }
      },
    );
    handler.next(response);
  }
}

class LogPrinter({
  required final void Function(String data) printFunction,
  final int maxWidth = 90,
  final bool compact = true,
}) extends StringBuffer {
  void commit() {
    final str = toString();
    if (str.isNotEmpty) printFunction(str);
  }

  static void block({
    required void Function(LogPrinter printer) func,
    required void Function(String data) printFunction,
    int maxWidth = 90,
    bool compact = true,
  }) {
    final printer = LogPrinter(
      maxWidth: maxWidth,
      printFunction: printFunction,
      compact: compact,
    );
    try {
      func(printer);
    } catch (ex, s) {
      printer.writeAll(["Error thrown while writing dio logger log", ex, s]);
    } finally {
      printer.commit();
    }
  }

  void printRequestHeader(RequestOptions options) {
    final uri = options.uri;
    final method = options.method;
    printBoxed(header: 'Request ║ $method ', text: uri.toString());
  }

  void printBoxed({String? header, String? text}) {
    writeln('');
    writeln('╔╣ $header');
    writeln('║  $text');
    writeln('╚');
  }

  void printMapAsTable(Map? map, {String? header}) {
    if (map == null || map.isEmpty) return;
    writeln('╔ $header ');
    for (final entry in map.entries) {
      printKV(entry.key.toString(), entry.value);
    }
    writeln('╚');
  }

  void printKV(String? key, Object? v) {
    final pre = '╟ $key: ';
    final msg = v.toString();

    if (pre.length + msg.length > maxWidth) {
      writeln(pre);
      printBlock(msg);
    } else {
      writeln('$pre$msg');
    }
  }

  void printBlock(String msg) {
    final lines = (msg.length / maxWidth).ceil();
    for (var i = 0; i < lines; ++i) {
      writeln(
        (i >= 0 ? '║ ' : '') +
            msg.substring(
              i * maxWidth,
              math.min<int>(i * maxWidth + maxWidth, msg.length),
            ),
      );
    }
  }

  void printLine([String pre = '', String suf = '╝']) =>
      writeln('$pre${'═' * maxWidth}$suf');

  void printResponse(Response response) {
    if (response.data != null) {
      if (response.data is Map) {
        printPrettyMap(response.data as Map);
      } else if (response.data is Uint8List) {
        writeln('║${_indent()}[');
        _printUint8List(response.data as Uint8List);
        writeln('║${_indent()}]');
      } else if (response.data is List) {
        writeln('║${_indent()}[');
        _printList(response.data as List);
        writeln('║${_indent()}]');
      } else {
        printBlock(response.data.toString());
      }
    }
  }

  void printResponseHeader(Response response, int responseTime) {
    final uri = response.requestOptions.uri;
    final method = response.requestOptions.method;
    printBoxed(
      header:
          'Response ║ $method ║ Status: ${response.statusCode} ${response.statusMessage}  ║ Time: $responseTime ms',
      text: uri.toString(),
    );
  }

  String _indent([int tabCount = DioLogger.kInitialTab]) =>
      DioLogger.tabStep * tabCount;

  void printPrettyMap(
    Map data, {
    int initialTab = DioLogger.kInitialTab,
    bool isListItem = false,
    bool isLast = false,
  }) {
    var tabs = initialTab;
    final isRoot = tabs == DioLogger.kInitialTab;
    final initialIndent = _indent(tabs);
    tabs++;

    if (isRoot || isListItem) writeln('║$initialIndent{');

    for (var index = 0; index < data.length; index++) {
      final isLast = index == data.length - 1;
      final key = '"${data.keys.elementAt(index)}"';
      dynamic value = data[data.keys.elementAt(index)];
      if (value is String) {
        value = '"${value.toString().replaceAll(RegExp(r'([\r\n])+'), " ")}"';
      }
      if (value is Map) {
        if (compact && _canFlattenMap(value)) {
          writeln('║${_indent(tabs)} $key: $value${!isLast ? ',' : ''}');
        } else {
          writeln('║${_indent(tabs)} $key: {');
          printPrettyMap(value, initialTab: tabs);
        }
      } else if (value is List) {
        if (compact && _canFlattenList(value)) {
          writeln('║${_indent(tabs)} $key: ${value.toString()}');
        } else {
          writeln('║${_indent(tabs)} $key: [');
          _printList(value, tabs: tabs);
          writeln('║${_indent(tabs)} ]${isLast ? '' : ','}');
        }
      } else {
        final msg = value.toString().replaceAll('\n', '');
        final indent = _indent(tabs);
        final linWidth = maxWidth - indent.length;
        if (msg.length + indent.length > linWidth) {
          final lines = (msg.length / linWidth).ceil();
          for (var i = 0; i < lines; ++i) {
            final multilineKey = i == 0 ? "$key:" : "";
            writeln(
              '║${_indent(tabs)} $multilineKey ${msg.substring(i * linWidth, math.min<int>(i * linWidth + linWidth, msg.length))}',
            );
          }
        } else {
          writeln('║${_indent(tabs)} $key: $msg${!isLast ? ',' : ''}');
        }
      }
    }

    writeln('║$initialIndent}${isListItem && !isLast ? ',' : ''}');
  }

  void _printList(List list, {int tabs = DioLogger.kInitialTab}) {
    for (var i = 0; i < list.length; i++) {
      final element = list[i];
      final isLast = i == list.length - 1;
      if (element is Map) {
        if (compact && _canFlattenMap(element)) {
          writeln('║${_indent(tabs)}  $element${!isLast ? ',' : ''}');
        } else {
          printPrettyMap(
            element,
            initialTab: tabs + 1,
            isListItem: true,
            isLast: isLast,
          );
        }
      } else {
        writeln('║${_indent(tabs + 2)} $element${isLast ? '' : ','}');
      }
    }
  }

  void _printUint8List(Uint8List list, {int tabs = DioLogger.kInitialTab}) {
    var chunks = [];
    for (var i = 0; i < list.length; i += DioLogger.chunkSize) {
      chunks.add(
        list.sublist(
          i,
          i + DioLogger.chunkSize > list.length
              ? list.length
              : i + DioLogger.chunkSize,
        ),
      );
    }
    for (var element in chunks) {
      writeln('║${_indent(tabs)} ${element.join(", ")}');
    }
  }

  bool _canFlattenMap(Map map) {
    return map.values
            .where((dynamic val) => val is Map || val is List)
            .isEmpty &&
        map.toString().length < maxWidth;
  }

  bool _canFlattenList(List list) {
    return list.length < 10 && list.toString().length < maxWidth;
  }
}

/// Filter arguments
class FilterArgs {
  /// If the filter is for a request or response
  final bool isResponse;

  /// if the [isResponse] is false, the data is the [RequestOptions.data]
  /// if the [isResponse] is true, the data is the [Response.data]
  final dynamic data;

  /// Returns true if the data is a string
  bool get hasStringData => data is String;

  /// Returns true if the data is a map
  bool get hasMapData => data is Map;

  /// Returns true if the data is a list
  bool get hasListData => data is List;

  /// Returns true if the data is a Uint8List
  bool get hasUint8ListData => data is Uint8List;

  /// Returns true if the data is a json data
  bool get hasJsonData => hasMapData || hasListData;

  /// Default constructor
  const FilterArgs(this.isResponse, this.data);
}
