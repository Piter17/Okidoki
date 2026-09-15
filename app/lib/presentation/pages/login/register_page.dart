import 'package:api_bindings/api_bindings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/mutations/mutations.dart';

class RegisterForm extends FormGroup {
  new()
    : super(
        {
          profileName: FormControl<String>(validators: [Validators.required]),
          password: FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(6),
            ],
          ),
          email: FormControl<String>(
            validators: [Validators.required, Validators.email],
          ),
          password2: FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(6),
            ],
          ),
        },
        validators: [
          MustMatchValidator(
            password,
            password2,
            true,
          ),
        ],
      );

  static const profileName = "profileName";
  static const email = "email";
  static const password = "password";
  static const password2 = "password2";

  UserRegisterRequest getModel() => UserRegisterRequest(
    email: control(email).value as String,
    profileName: control(profileName).value as String,
    password: control(password).value as String,
  );
}

@RoutePage()
class RegisterPage extends HookConsumerWidget {
  const RegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formGroup = useMemoized(RegisterForm.new);
    final register = useMemoized(AuthMutations.getRegister);

    final registerState = ref.watch(register);
    Future send() => register.run(
      ref,
      AuthMutations.registerCb(formGroup.getModel()),
    );

    register.showPopupOnError(context, ref);

    return Scaffold(
      body: BackgroundPage(
        isLoading: registerState is MutationPending,
        child: ReactiveForm(
          formGroup: formGroup,
          child: Column(
            spacing: context.values.spacing,
            children: [
              ReactiveTextField(
                formControlName: RegisterForm.profileName,
                decoration: InputDecoration(
                  labelText: context.s.profile_display_name,
                ),
              ),
              ReactiveTextField(
                formControlName: RegisterForm.email,
                decoration: InputDecoration(labelText: context.s.generic_email),
              ),
              ReactiveTextField(
                formControlName: RegisterForm.password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: context.s.generic_password,
                ),
              ),
              ReactiveTextField(
                formControlName: RegisterForm.password2,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: context.s.generic_password,
                ),
              ),
              ReactiveFormConsumer(
                child: Text(context.s.generic_register),
                builder: (_, formGroup, child) => Button(
                  onPressed:
                      formGroup.valid && registerState is! MutationPending
                      ? send
                      : null,
                  child: child!,
                ),
              ),
              Button(
                onPressed: () => context.router.replace(LoginRoute()),
                buttonType: ButtonType.text,
                child: Text(context.s.generic_login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
