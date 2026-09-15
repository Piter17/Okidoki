import 'package:api_bindings/api_bindings.dart';
import 'package:auto_route/auto_route.dart';

import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/mutations/mutations/auth/auth_mutations.dart';

class LoginForm extends FormGroup {
  new()
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

  LoginRequest getModel() => LoginRequest(
    email: control(email).value as String,
    password: control(password).value as String,
  );
}

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formGroup = useMemoized(LoginForm.new);
    final login = useMemoized(AuthMutations.getLogin);

    final loginState = ref.watch(login);
    Future send() => login.run(
      ref,
      AuthMutations.loginCb(formGroup.getModel()),
    );

    login.showPopupOnError(context, ref);

    return Scaffold(
      body: BackgroundPage(
        isLoading: loginState is MutationPending,
        child: ReactiveForm(
          formGroup: formGroup,
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
                onSubmitted: (x) => send(),
              ),
              ReactiveFormConsumer(
                child: Text(context.s.generic_login),
                builder: (_, formGroup, child) => Button(
                  onPressed: formGroup.valid && loginState is! MutationPending
                      ? send
                      : null,
                  child: child!,
                ),
              ),
              Button(
                onPressed: () => context.router.replace(RegisterRoute()),
                buttonType: ButtonType.text,
                child: Text(context.s.generic_register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
