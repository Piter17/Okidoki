import 'package:auto_route/auto_route.dart';
import 'package:okidoki/forms/auth_forms.dart';
import 'package:okidoki/mutations/mutations.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

@RoutePage()
class const RegisterPage({super.key, final String? guildInvitationCode})
    extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
      registerFormProvider(guildInvitationCode: guildInvitationCode),
    );
    final mutation = useMemoized(AuthMutations.getRegister);

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
                formControlName: RegisterForm.profileName,
                decoration: InputDecoration(
                  labelText: context.s.profile_display_name,
                  helperText: " ",
                ),
              ),
              if (form.requireValue is FullRegisterForm) ...[
                ReactiveTextField(
                  formControlName: FullRegisterForm.email,
                  decoration: InputDecoration(
                    labelText: context.s.generic_email,
                    helperText: " ",
                  ),
                ),
                ReactiveTextField(
                  formControlName: FullRegisterForm.password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: context.s.generic_password,
                    helperText: " ",
                  ),
                ),
              ],
              ReactiveFormConsumer(
                builder: (_, formGroup, child) => Button(
                  onPressed: formGroup.valid && isBusy == false ? send : null,
                  child: Text(context.s.generic_register),
                ),
              ),
            ],
          ),
        ),
        Align(
          child: Button(
            onPressed: () => context.router.navigate(LoginRoute()),
            buttonType: ButtonType.text,
            child: Text("Mam już konto"),
          ),
        ),
      ],
    );
  }
}
