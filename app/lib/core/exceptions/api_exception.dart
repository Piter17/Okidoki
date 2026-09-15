class ApiException<TError>(
  final String title,
  final TError error,
  final StackTrace st,
) implements Exception;
