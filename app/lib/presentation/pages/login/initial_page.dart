import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:riv/mutations/mutations.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:flutter/material.dart' hide Step;

@RoutePage()
class const AuthPage({super.key}) extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = useState(UniqueKey());
    final canRegisterAnonymus = true;
    final loginGroup = useMemoized(LoginForm.new);
    final registerGroup = RegisterForm(allowAnonymus: canRegisterAnonymus);

    final auth = useMemoized(AuthMutations.getLogin);
    final authState = ref.watch(auth);

    return Scaffold(
      key: key.value,
      body: BackgroundPage(
        drawLogo: true,
        logoOutsideContainer: false,
        isLoading: false,
        child: SizedBox(
          height: 400,
          child: ProcessStepsView(
            steps: {
              "1": (ctx, c) => Step(
                controller: c,
              ),
              "2": (ctx, c) => Step(
                controller: c,
              ),
              "Login": (ctx, c) => LoginPage(
                form: loginGroup,
                isBusy: authState is MutationPending,
                mutation: auth,
                goToRegister: () => c.goTo("Register"),
              ),
              "Register": (ctx, c) => RegisterPage(
                form: registerGroup,
                isBusy: authState is MutationPending,
                mutation: auth,
                goToLogin: () => c.goTo("Login"),
              ),
            },
          ),
        ),
      ),
    );
  }
}

abstract class const BaseAuthPage({
  super.key,
  required final FormGroupMutation form,
  required final Mutation mutation,
  required final bool isBusy,
}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

// class AuthController extends StepController {
//   AuthController()
//     : super(
//         steps: {
//           "3": (ctx, c) => LoginPage(
//             form: loginGroup,
//             isBusy: authState is MutationPending,
//             mutation: auth,
//             changeForm: () => goToRegister(c),
//           ),
//           "4": (ctx, c) => RegisterPage(
//             form: registerGroup,
//             isBusy: authState is MutationPending,
//             mutation: auth,
//             changeForm: () => goToLogin(c),
//           ),
//         },
//       );

//   static void goToLogin(StepController stepController) =>
//       stepController.goTo("3");

//   void goToRegister(StepController stepController) => stepController.goTo("4");
// }

// class const _RegisterForm({
//   required final FormGroup formGroup,
//   required final bool isBusy,
//   required final VoidCallback send,
//   required final VoidCallback changeForm,
//   required final bool shortForm,
// }) extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => ReactiveForm(
//     formGroup: formGroup,
//     child: Column(
//       spacing: context.values.spacing,
//       children: [
//         Button(
//           onPressed: changeForm,
//           buttonType: ButtonType.text,
//           child: Text(context.s.generic_login),
//         ),
//         ReactiveTextField(
//           formControlName: RegisterForm.profileName,
//           decoration: InputDecoration(
//             labelText: context.s.profile_display_name,
//           ),
//         ),
//         ReactiveCheckbox(
//           formControlName: RegisterForm.anonymus,
//           // title: Text(context.s.generic_accept_terms),
//         ),
//         ReactiveFormConsumer(
//           builder: (_, formGroup, child) {
//             if (formGroup.control(RegisterForm.anonymus).value) {
//               formGroup.control(RegisterForm.email).markAsDisabled();
//               formGroup.control(RegisterForm.password).markAsDisabled();
//             } else {
//               formGroup.control(RegisterForm.email).markAsEnabled();
//               formGroup.control(RegisterForm.password).markAsEnabled();
//             }

//             return Column(
//               children: [
//                 if (formGroup.control(RegisterForm.anonymus).value ==
//                     false) ...[
//                   ReactiveTextField(
//                     formControlName: RegisterForm.email,
//                     decoration: InputDecoration(
//                       labelText: context.s.generic_email,
//                     ),
//                   ),
//                   ReactiveTextField(
//                     formControlName: RegisterForm.password,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: context.s.generic_password,
//                     ),
//                   ),
//                 ],
//                 Button(
//                   onPressed: formGroup.valid && isBusy == false ? send : null,
//                   child: Text(context.s.generic_register),
//                 ),
//               ],
//             );
//           },
//         ),
//         Spacer(),
//       ],
//     ),
//   );
// }

// class const _LoginForm({
//   required final FormGroup loginGroup,
//   required final bool isBusy,
//   required final VoidCallback send,
//   required final VoidCallback changeForm,
// }) extends HookConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ReactiveForm(
//       formGroup: loginGroup,
//       child: Column(
//         spacing: context.values.spacing,
//         children: [
//           Button(
//             onPressed: changeForm,
//             buttonType: ButtonType.text,
//             child: Text(context.s.generic_register),
//           ),
//           ReactiveTextField(
//             formControlName: LoginForm.email,
//             decoration: InputDecoration(labelText: context.s.generic_email),
//           ),
//           ReactiveTextField(
//             formControlName: LoginForm.password,
//             obscureText: true,
//             decoration: InputDecoration(
//               labelText: context.s.generic_password,
//             ),
//             onSubmitted: (x) => send(),
//           ),
//           ReactiveFormConsumer(
//             child: Text(context.s.generic_login),
//             builder: (_, formGroup, child) => Button(
//               onPressed: formGroup.valid && isBusy == false ? send : null,
//               child: child!,
//             ),
//           ),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }
