import 'package:test/test.dart';
import 'package:api_bindings/api_bindings.dart';

/// tests for AuthApi
void main() {
  final instance = ApiBindings().getAuthApi();

  group(AuthApi, () {
    //Future<InfoResponse> getinfo() async
    test('test getinfo', () async {
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

    //Future postforgotPassword(ForgotPasswordRequest forgotPasswordRequest) async
    test('test postforgotPassword', () async {
      // TODO
    });

    //Future<InfoResponse> postinfo(InfoRequest infoRequest) async
    test('test postinfo', () async {
      // TODO
    });

    //Future<AccessTokenResponse> postlogin(LoginRequest loginRequest, { bool useCookies, bool useSessionCookies }) async
    test('test postlogin', () async {
      // TODO
    });

    //Future<AccessTokenResponse> postrefresh(RefreshRequest refreshRequest) async
    test('test postrefresh', () async {
      // TODO
    });

    //Future postresendConfirmationEmail(ResendConfirmationEmailRequest resendConfirmationEmailRequest) async
    test('test postresendConfirmationEmail', () async {
      // TODO
    });

    //Future postresetPassword(ResetPasswordRequest resetPasswordRequest) async
    test('test postresetPassword', () async {
      // TODO
    });
  });
}
