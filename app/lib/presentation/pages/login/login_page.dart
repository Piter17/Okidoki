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

// class RegisterForm extends FormGroup {
//   new()
//     : super(
//         {
//           profileName: FormControl<String>(validators: [Validators.required]),
//           password: FormControl<String>(
//             validators: [
//               Validators.required,
//               Validators.minLength(6),
//             ],
//           ),
//           email: FormControl<String>(
//             validators: [Validators.required, Validators.email],
//           ),
//           password2: FormControl<String>(
//             validators: [
//               Validators.required,
//               Validators.minLength(6),
//             ],
//           ),
//         },
//         validators: [
//           MustMatchValidator(
//             password,
//             password2,
//             true,
//           ),
//         ],
//       );

//   static const profileName = "profileName";
//   static const email = "email";
//   static const password = "password";
//   static const password2 = "password2";

//   FullRegistrationRequest getModel() => FullRegistrationRequest(
//     email: control(email).value as String,
//     profileName: control(profileName).value as String,
//     password: control(password).value as String,
//   );
// }

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogin = useState(true);

    final loginGroup = useMemoized(LoginForm.new);
    final login = useMemoized(AuthMutations.getLogin);

    final loginState = ref.watch(login);
    Future postLogin() => login.run(
      ref,
      AuthMutations.loginCb(loginGroup.getModel()),
    );

    final registerGroup = useMemoized(RegisterForm.new);

    Future postRegister() => login.run(
      ref,
      AuthMutations.registerCb(registerGroup.getModel()),
    );

    login.showPopupOnError(context, ref);

    late AnimationController controller = useAnimationController(
      duration: const Duration(milliseconds: 600),
    )..animateTo(1);

    void changeForm() {
      isLogin.value ^= true;
      controller.forward(from: 0);
    }

    return Scaffold(
      body: BackgroundPage(
        controller: controller,
        isLoading: loginState is MutationPending,
        child: isLogin.value
            ? _LoginForm(
                loginGroup: loginGroup,
                isBusy: loginState is MutationPending,
                send: postLogin,
                changeForm: changeForm,
              )
            : _RegisterForm(
                formGroup: registerGroup,
                isBusy: loginState is MutationPending,
                send: postRegister,
                changeForm: changeForm,
              ),
      ),
    );
  }
}

class const _RegisterForm({
  required final FormGroup formGroup,
  required final bool isBusy,
  required final VoidCallback send,
  required final VoidCallback changeForm,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ReactiveForm(
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
        ReactiveFormConsumer(
          child: Text(context.s.generic_register),
          builder: (_, formGroup, child) => Button(
            onPressed: formGroup.valid && isBusy == false ? send : null,
            child: child!,
          ),
        ),
        Button(
          onPressed: changeForm,
          buttonType: ButtonType.text,
          child: Text(context.s.generic_login),
        ),
      ],
    ),
  );
}

class const _LoginForm({
  required final FormGroup loginGroup,
  required final bool isBusy,
  required final VoidCallback send,
  required final VoidCallback changeForm,
}) extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveForm(
      formGroup: loginGroup,
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
              onPressed: formGroup.valid && isBusy == false ? send : null,
              child: child!,
            ),
          ),
          Button(
            onPressed: changeForm,
            buttonType: ButtonType.text,
            child: Text(context.s.generic_register),
          ),
        ],
      ),
    );
  }
}
