import 'package:api_bindings/api_bindings.dart';
import 'package:darq/darq.dart';
import 'package:riv/mutations/mutations.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';

class AuthMutations {
  static Mutation<void> getLogin() => Mutation<void>();
  static MutationCallback<void> loginCb(LoginRequest request) =>
      (tsx) => tsx
          .callApiE(
            (x) => x.getAuthApi().postLogin(loginRequest: request),
            errorTitle: "Failed to login ${request.email}",
            getError: (HttpValidationProblemDetails e) =>
                "Check email and password",
            authenticated: false,
          )
          .then(
            (x) => tsx
                .get(tokenStorageProvider.notifier)
                .saveToken(AccessToken.fromResult(x)),
          );

  static Mutation<void> getRegister() => Mutation<void>();
  static MutationCallback<void> registerCb(
    FullRegistrationRequest request,
  ) =>
      (tsx) => tsx
          .callApiE(
            (x) => x.getAuthApi().register(
              fullRegistrationRequest: request,
            ),
            errorTitle: "Failed to register account",
            getError: (HttpValidationProblemDetails e) =>
                e.errors?.entries.selectMany((a, i) => a.value).join("\n"),
            authenticated: false,
          )
          .then(
            (_) => loginCb(
              LoginRequest(
                email: request.email,
                password: request.password,
              ),
            )(tsx),
          );

  static Mutation<void> getForgotPassword() => Mutation<void>();
  static MutationCallback<void> forgotPasswordCb(
    ForgotPasswordRequest request,
  ) =>
      (tsx) => tsx.callApiE(
        (x) =>
            x.getAuthApi().postForgotPassword(forgotPasswordRequest: request),
        errorTitle: "Failed to send forgot password request",
        getError: (HttpValidationProblemDetails e) =>
            e.errors?.entries.selectMany((a, i) => a.value).join("\n"),
        authenticated: false,
      );

  static MutationCallback logoffMutationCallback() =>
      (tsx) => tsx.get(tokenStorageProvider.notifier).logOff();
}
