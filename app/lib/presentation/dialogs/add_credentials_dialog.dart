import 'package:okidoki/forms/auth_forms.dart';
import 'package:okidoki/mutations/mutations.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/utils/responsive_popup.dart';

class const AddCredentialsDialog({super.key}) extends HookConsumerWidget {
  static Future<void> open(BuildContext context) {
    return showResponsivePopup(
      context: context,
      showDragHandle: true,
      builder: (context) => AddCredentialsDialog(),
      dialogConstraints: BoxConstraints(maxWidth: 560),
      dismissible: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addCredentialsFormProvider);
    final mutation = useMemoized(AuthMutations.getAddCredentials);

    mutation.onSuccess(context, ref, () => Navigator.of(context).pop());
    mutation.showPopupOnError(context, ref);
    final isBusy = ref.watch(mutation) is MutationPending;

    if (form.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    Future send() => mutation.run(
      ref,
      form.requireValue.getMutation(),
    );

    return BaseDialog(
      title: "Add credentials",
      child: ReactiveForm(
        formGroup: form.requireValue,
        child: Column(
          spacing: context.values.spacing,
          children: [
            ReactiveTextField(
              formControlName: AddCredentialsForm.email,
              decoration: InputDecoration(
                labelText: context.s.generic_email,
                helperText: " ",
              ),
            ),
            ReactiveTextField(
              formControlName: AddCredentialsForm.password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: context.s.generic_password,
                helperText: " ",
              ),
            ),
            ReactiveFormConsumer(
              builder: (_, formGroup, child) => Button(
                onPressed: formGroup.valid && isBusy == false ? send : null,
                child: Text(context.s.generic_save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
