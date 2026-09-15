import 'package:darq/darq.dart';

extension SimpleCompareExtension<T> on Iterable<T> {
  int Function(T, T) getSimpleComparer<R extends Comparable<R>>(
    R Function(T item) selector,
  ) =>
      (x, y) => selector(x).compareTo(selector(y));

  T simpleMin<R extends Comparable<R>>(R Function(T x) predicate) =>
      min(getSimpleComparer(predicate));

  T simpleMax<R extends Comparable<R>>(R Function(T x) predicate) =>
      max(getSimpleComparer(predicate));
}
