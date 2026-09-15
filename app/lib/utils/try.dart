class Try {
  static R invoke<R>(R Function() f, String errorText) {
    try {
      return f();
    } catch (e, s) {
      throw Exception((errorText, e, s));
    }
  }
}
