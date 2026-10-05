## Dart constructors

Prefer Dart 3 primary constructors whenever they are valid and improve readability.

Use primary constructors for simple data/domain classes:

```dart
class User(String name, {int age = 0});
```

Do not expand a primary constructor into a traditional constructor unless:

initialization requires non-trivial logic,
multiple fields need custom normalization,
an initializer list is required,
the class extends a superclass requiring explicit forwarding,
the existing surrounding code consistently uses traditional constructors.
When editing existing Dart code, preserve the constructor style already used nearby.