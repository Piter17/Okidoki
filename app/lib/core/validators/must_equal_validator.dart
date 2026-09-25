import 'package:riv/presentation/presentation.dart';

class MustEqualValidator<T> extends Validator<dynamic> {
  final String controlName;
  final T value;

  MustEqualValidator({
    required this.controlName,
    required this.value,
  }) : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = {ValidationMessage.mustMatch: true};

    if (control is! FormGroup) {
      return error;
    }
    final formControl = control.control(controlName);
    print(["mustEqualValidator", control.value, value]);

    if (formControl.value != value) {
      formControl.setErrors({'mustEqual': true});

      // Force messages to show up as soon as possible
      formControl.markAsTouched();
    } else {
      formControl.removeError('mustEqual');
    }

    return null;
  }
}
