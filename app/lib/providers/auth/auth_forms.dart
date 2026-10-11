import 'package:api_bindings/api_bindings.dart';
import 'package:okidoki/forms/auth_forms.dart' as forms;
import 'package:okidoki/providers/auth/register_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_forms.g.dart';

@Riverpod(name: 'registerFormProvider')
class RegisterFormProvider extends _$RegisterFormProvider {
  @override
  Future<forms.RegisterForm> build({
    required String? guildInvitationCode,
  }) async {
    final registerOptions = ref.watch(registerOptionsProvider);
    if (registerOptions.isLoading) {
      return future;
    }
    final fromInvite = guildInvitationCode != null;
    final value = registerOptions.requireValue;
    final anonymusRegister = switch (value.anonymousRegister) {
      AnonymousRegister.allow => true,
      AnonymousRegister.allowOnInvite => fromInvite,
      AnonymousRegister.deny => false,
    };
    return anonymusRegister
        ? forms.RegisterForm(
            guildInvitationCode: guildInvitationCode,
          )
        : forms.FullRegisterForm(
            guildInvitationCode: guildInvitationCode,
            passwordOptions: registerOptions.requireValue.password,
          );
  }
}

@Riverpod(name: 'addCredentialsFormProvider')
class AddCredentialsFormProvider extends _$AddCredentialsFormProvider {
  @override
  Future<forms.AddCredentialsForm> build() async {
    final registerOptions = ref.watch(registerOptionsProvider);
    if (registerOptions.isLoading || registerOptions.hasError) {
      return future;
    }
    final value = registerOptions.requireValue;
    return forms.AddCredentialsForm(
      passwordOptions: value.password,
    );
  }
}

@Riverpod(name: 'loginFormProvider')
class LoginFormProvider extends _$LoginFormProvider {
  @override
  Future<forms.LoginForm> build() async {
    final registerOptions = ref.watch(registerOptionsProvider);
    if (registerOptions.isLoading || registerOptions.hasError) {
      return future;
    }
    final value = registerOptions.requireValue;
    return forms.LoginForm(
      passwordOptions: value.password,
    );
  }
}
