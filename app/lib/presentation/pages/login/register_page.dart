import 'package:api_bindings/api_bindings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/mutations/mutations.dart';

abstract class FormGroupMutation<T> extends FormGroup {
  new(super.controls);

  MutationCallback<T> getMutation();
}

class RegisterForm({
  bool allowAnonymus = true,
  this._guildInvitationCode,
}) extends FormGroup implements FormGroupMutation<void> {
  this
    : super(
        {
          profileName: FormControl<String>(validators: [Validators.required]),
          anonymus: FormControl<bool>(value: allowAnonymus),
          password: FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(6),
            ],
          ),
          email: FormControl<String>(
            validators: [Validators.required, Validators.email],
          ),
        },
      );

  static const profileName = "profileName";
  static const email = "email";
  static const password = "password";
  static const anonymus = "anonymus";

  bool get _anonymus => control(anonymus).value as bool;
  final String? _guildInvitationCode;

  @override
  MutationCallback<void> getMutation() => _anonymus
      ? AuthMutations.anonymusRegisterCb(_anonModel)
      : AuthMutations.registerCb(_model);

  AnonymusRegistrationRequest get _anonModel => AnonymusRegistrationRequest(
    profileName: control(profileName).value as String,
    guildInvitationCode: _guildInvitationCode,
  );

  RegistrationRequest get _model => RegistrationRequest(
    email: control(email).value as String,
    profileName: control(profileName).value as String,
    password: control(password).value as String,
    guildInvitationCode: _guildInvitationCode,
  );
}

@RoutePage()
class const RegisterPage({
  super.key,
  required RegisterForm super.form,
  required super.mutation,
  required super.isBusy,
  required final VoidCallback goToLogin,
}) extends BaseAuthPage {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future send() => mutation.run(
      ref,
      form.getMutation(),
    );

    mutation.showPopupOnError(context, ref);

    return ReactiveForm(
      formGroup: form,
      child: Column(
        spacing: context.values.spacing,
        children: [
          ReactiveTextField(
            formControlName: RegisterForm.profileName,
            decoration: InputDecoration(
              labelText: context.s.profile_display_name,
            ),
          ),
          ReactiveFormConsumer(
            builder: (_, formGroup, child) {
              if (formGroup.control(RegisterForm.anonymus).value) {
                formGroup.control(RegisterForm.email).markAsDisabled();
                formGroup.control(RegisterForm.password).markAsDisabled();
              } else {
                formGroup.control(RegisterForm.email).markAsEnabled();
                formGroup.control(RegisterForm.password).markAsEnabled();
              }

              return Column(
                children: [
                  if (formGroup.control(RegisterForm.anonymus).value ==
                      false) ...[
                    ReactiveTextField(
                      formControlName: RegisterForm.email,
                      decoration: InputDecoration(
                        labelText: context.s.generic_email,
                      ),
                    ),
                    ReactiveTextField(
                      formControlName: RegisterForm.password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: context.s.generic_password,
                      ),
                    ),
                  ],
                  Button(
                    onPressed: formGroup.valid && isBusy == false ? send : null,
                    child: Text(context.s.generic_register),
                  ),
                  Button(
                    onPressed: goToLogin,
                    buttonType: ButtonType.text,
                    child: Text(context.s.generic_login),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
