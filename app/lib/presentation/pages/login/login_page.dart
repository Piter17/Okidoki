// ignore_for_file: unused_local_variable

import 'package:api_bindings/api_bindings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:okidoki/core/core.dart';
import 'package:okidoki/mutations/mutations/auth/auth_mutations.dart';
import 'package:okidoki/presentation/presentation.dart'
    hide ValueListenableBuilder;

class LoginForm({
  this._guildInvitationCode,
}) extends FormGroupMutation<void> {
  this
    : super(
        {
          email: FormControl<String>(
            validators: [Validators.required, Validators.email],
          ),
          password: FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(6),
            ],
          ),
        },
      );

  static const email = "email";
  static const password = "password";
  final String? _guildInvitationCode;

  @override
  MutationCallback<void> getMutation() => AuthMutations.loginCb(getModel());

  LoginRequest getModel() => LoginRequest(
    email: control(email).value as String,
    password: control(password).value as String,
  );
}

@RoutePage()
class const LoginPage({
  super.key,
  required LoginForm super.form,
  required super.mutation,
  required super.isBusy,
  required final VoidCallback goToRegister,
}) extends BaseAuthPage {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future postLogin() => mutation.run(
      ref,
      form.getMutation(),
    );

    final loginState = ref.watch(mutation);
    mutation.showPopupOnError(context, ref);

    return ReactiveForm(
      formGroup: form,
      child: Column(
        spacing: context.values.spacing,
        children: [
          ReactiveTextField(
            formControlName: LoginForm.email,
            decoration: InputDecoration(labelText: context.s.generic_email),
          ),
          ReactiveTextField(
            formControlName: LoginForm.password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: context.s.generic_password,
            ),
            onSubmitted: (x) => postLogin(),
          ),
          ReactiveFormConsumer(
            builder: (_, formGroup, child) => Button(
              onPressed: formGroup.valid && isBusy == false ? postLogin : null,
              child: Text(context.s.generic_login),
            ),
          ),
          Button(
            onPressed: goToRegister,
            buttonType: ButtonType.text,
            child: Text(context.s.generic_register),
          ),
        ],
      ),
    );
  }
}
