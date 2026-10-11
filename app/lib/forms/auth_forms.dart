import 'package:api_bindings/api_bindings.dart' as api;
import 'package:okidoki/domain/domain.dart';
import 'package:okidoki/mutations/mutations.dart';
import 'package:reactive_forms/reactive_forms.dart';

Map<String, FormControl> _profileControl() => {
  _profileName: FormControl<String>(
    validators: [Validators.required],
  ),
};

Map<String, FormControl> _emailControl() => {
  _email: FormControl<String>(
    validators: [Validators.required, Validators.email],
  ),
};

Map<String, FormControl> _passwordControl(PasswordOptions passwordOptions) => {
  _password: FormControl<String>(
    validators: [
      Validators.required,
      Validators.minLength(passwordOptions.requiredLength),
    ],
  ),
};

const _profileName = "profileName";
const _email = "email";
const _password = "password";

class RegisterForm({
  required final String? guildInvitationCode,
  final Map<String, FormControl>? addedControls,
}) extends FormGroup implements MutationCreator<void> {
  this
    : super(
        {
          ..._profileControl(),
          ...?addedControls,
        },
      );

  static const profileName = _profileName;

  @override
  MutationCallback<void> getMutation() =>
      AuthMutations.anonymusRegisterCb(_model);

  api.AnonymusRegistrationRequest get _model => api.AnonymusRegistrationRequest(
    profileName: control(profileName).value as String,
    guildInvitationCode: guildInvitationCode,
  );
}

class FullRegisterForm({
  required super.guildInvitationCode,
  required PasswordOptions passwordOptions,
}) extends RegisterForm implements MutationCreator<void> {
  this
    : super(
        addedControls: {
          ..._emailControl(),
          ..._passwordControl(passwordOptions),
        },
      );

  static const profileName = _profileName;
  static const email = _email;
  static const password = _password;

  @override
  MutationCallback<void> getMutation() => AuthMutations.registerCb(_fullModel);

  api.RegistrationRequest get _fullModel => api.RegistrationRequest(
    email: control(email).value as String,
    profileName: control(profileName).value as String,
    password: control(password).value as String,
    guildInvitationCode: guildInvitationCode,
  );
}

class AddCredentialsForm({required PasswordOptions passwordOptions})
    extends FormGroup
    implements MutationCreator<void> {
  this
    : super(
        {
          ..._emailControl(),
          ..._passwordControl(passwordOptions),
        },
      );

  static const email = _email;
  static const password = _password;

  @override
  MutationCallback<void> getMutation() =>
      AuthMutations.addCredentialsCb(_model);

  api.AddCredentialsRequest get _model => api.AddCredentialsRequest(
    email: control(email).value as String,
    password: control(password).value as String,
  );
}

class LoginForm({
  required PasswordOptions passwordOptions,
}) extends FormGroup implements MutationCreator<void> {
  this
    : super(
        {
          ..._emailControl(),
          ..._passwordControl(passwordOptions),
        },
      );

  static const email = _email;
  static const password = _password;

  @override
  MutationCallback<void> getMutation() => AuthMutations.loginCb(
    api.LoginRequest(
      email: control(email).value as String,
      password: control(password).value as String,
    ),
  );
}

class ForgotPasswordForm() extends FormGroup implements MutationCreator<void> {
  this
    : super(
        {
          ..._emailControl(),
        },
      );

  static const email = _email;

  @override
  MutationCallback<void> getMutation() => AuthMutations.forgotPasswordCb(
    api.ForgotPasswordRequest(
      email: control(email).value as String,
    ),
  );
}
