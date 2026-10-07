// import 'package:auto_route/auto_route.dart';
// import 'package:okidoki/mutations/mutations.dart';
// import 'package:okidoki/presentation/presentation.dart';

// @RoutePage()
// class AuthPage({
//   super.key,
//   final String? guildInvitationCode,
// }) extends HookConsumerWidget {
//   static const _registerStep = "Register";
//   static const _inviteStep = "Invite";
//   static const _welcomeStep = "Welcome";
//   static const _loginStep = "Login";
//   static const _forgotPasswordStep = "ForgotPassword";

//   final routerKey = GlobalKey();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final key = useState(UniqueKey());
//     final canRegisterAnonymus = true;
//     final loginGroup = useMemoized(LoginForm.new);
//     final registerGroup = RegisterForm(allowAnonymus: canRegisterAnonymus);

//     final auth = useMemoized(AuthMutations.getLogin);
//     final authState = ref.watch(auth);

//     return Scaffold(
//       key: key.value,
//       body: BackgroundPage(
//         drawLogo: true,
//         logoOutsideContainer: false,
//         isLoading: false,
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(
//             maxHeight: 400,
//             maxWidth: 300,
//           ),
//           child: Padding(
//             padding: context.values.containerPaddingL,
//             child: AutoRouter(
//               key: routerKey,
//               builder: (context, content) {
//                 return content;
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// abstract class const BaseAuthPage({
//   super.key,
//   required final FormGroupMutation form,
//   required final Mutation mutation,
//   required final bool isBusy,
// }) extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container();
//   }
// }

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:okidoki/mutations/mutations.dart';
import 'package:okidoki/presentation/presentation.dart';

@RoutePage()
class const AuthPage({
  super.key,
  final String? guildInvitationCode,
}) extends HookConsumerWidget {
  static const _registerStep = "Register";
  static const _inviteStep = "Invite";
  static const _welcomeStep = "Welcome";
  static const _loginStep = "Login";
  static const _forgotPasswordStep = "ForgotPassword";

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
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 400,
            maxWidth: 300,
          ),
          child: Padding(
            padding: context.values.containerPaddingL,
            child: ProcessStepsView(
              steps: {
                if (guildInvitationCode != null)
                  _inviteStep: (ctx, c) =>
                      InvitePagea(guildInvitationCode: guildInvitationCode!),
                _welcomeStep: (ctx, c) => WelcomePage(
                  goToRegister: () => c.goTo(_registerStep),
                  goToLogin: () => c.goTo(_loginStep),
                ),
                _loginStep: (ctx, c) => LoginPage(
                  form: loginGroup,
                  isBusy: authState is MutationPending,
                  mutation: auth,
                  goToRegister: () => c.goTo(_registerStep),
                ),
                _registerStep: (ctx, c) => RegisterPage(
                  form: registerGroup,
                  isBusy: authState is MutationPending,
                  mutation: auth,
                  goToLogin: () => c.goTo(_loginStep),
                ),
              },
            ),
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
