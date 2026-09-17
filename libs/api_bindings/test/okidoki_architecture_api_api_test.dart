import 'package:test/test.dart';
import 'package:api_bindings/api_bindings.dart';

/// tests for OkidokiArchitectureApiApi
void main() {
  final instance = ApiBindings().getOkidokiArchitectureApiApi();

  group(OkidokiArchitectureApiApi, () {
    //Future<InfoResponse> getInfo() async
    test('test getInfo', () async {
      // TODO
    });

    //Future mapIdentityApiApiAuthConfirmEmail(String userId, String code, { String changedEmail }) async
    test('test mapIdentityApiApiAuthConfirmEmail', () async {
      // TODO
    });

    //Future<TwoFactorResponse> post2fa(TwoFactorRequest twoFactorRequest) async
    test('test post2fa', () async {
      // TODO
    });

    //Future postForgotPassword(ForgotPasswordRequest forgotPasswordRequest) async
    test('test postForgotPassword', () async {
      // TODO
    });

    //Future<InfoResponse> postInfo(InfoRequest infoRequest) async
    test('test postInfo', () async {
      // TODO
    });

    //Future<AccessTokenResponse> postLogin(LoginRequest loginRequest, { bool useCookies, bool useSessionCookies }) async
    test('test postLogin', () async {
      // TODO
    });

    //Future<AccessTokenResponse> postRefresh(RefreshRequest refreshRequest) async
    test('test postRefresh', () async {
      // TODO
    });

    //Future postRegister() async
    test('test postRegister', () async {
      // TODO
    });

    //Future postResendConfirmationEmail(ResendConfirmationEmailRequest resendConfirmationEmailRequest) async
    test('test postResendConfirmationEmail', () async {
      // TODO
    });

    //Future postResetPassword(ResetPasswordRequest resetPasswordRequest) async
    test('test postResetPassword', () async {
      // TODO
    });
  });
}
