import 'package:auto_route/auto_route.dart';
import 'package:okidoki/forms/forms.dart';
import 'package:okidoki/mutations/mutations.dart';
import 'package:okidoki/presentation/presentation.dart'
    hide ValueListenableBuilder;
import 'package:okidoki/providers/providers.dart' hide LoginForm;

@RoutePage()
class const LoginPage({super.key}) extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginFormProvider);
    final mutation = useMemoized(AuthMutations.getLogin);

    mutation.showPopupOnError(context, ref);
    final isBusy = ref.watch(mutation) is MutationPending;

    if (form.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    Future send() => mutation.run(
      ref,
      form.requireValue.getMutation(),
    );

    return Column(
      children: [
        ReactiveForm(
          formGroup: form.requireValue,
          child: Column(
            spacing: context.values.spacing,
            children: [
              ReactiveTextField(
                formControlName: LoginForm.email,
                decoration: InputDecoration(
                  labelText: context.s.generic_email,
                  helperText: " ",
                ),
              ),
              ReactiveTextField(
                formControlName: LoginForm.password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: context.s.generic_password,
                  helperText: " ",
                ),
                onSubmitted: (_) => send(),
              ),
              ReactiveFormConsumer(
                builder: (_, formGroup, child) => Button(
                  onPressed: formGroup.valid && isBusy == false ? send : null,
                  child: Text(context.s.generic_login),
                ),
              ),
            ],
          ),
        ),
        Button(
          onPressed: () => context.router.push(RegisterRoute()),
          buttonType: ButtonType.text,
          child: Text("Nie masz konta? Zarejestruj się."),
        ),
      ],
    );
  }
}
