import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:okidoki/mutations/mutations.dart';
import 'package:okidoki/presentation/presentation.dart';

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
