# api_bindings.api.OkidokiArchitectureApiApi

## Load the API package
```dart
import 'package:api_bindings/api.dart';
```

All URIs are relative to *http://localhost:5133*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInfo**](OkidokiArchitectureApiApi.md#getinfo) | **GET** /api/auth/manage/info | 
[**mapIdentityApiApiAuthConfirmEmail**](OkidokiArchitectureApiApi.md#mapidentityapiapiauthconfirmemail) | **GET** /api/auth/confirmEmail | 
[**post2fa**](OkidokiArchitectureApiApi.md#post2fa) | **POST** /api/auth/manage/2fa | 
[**postForgotPassword**](OkidokiArchitectureApiApi.md#postforgotpassword) | **POST** /api/auth/forgotPassword | 
[**postInfo**](OkidokiArchitectureApiApi.md#postinfo) | **POST** /api/auth/manage/info | 
[**postLogin**](OkidokiArchitectureApiApi.md#postlogin) | **POST** /api/auth/login | 
[**postRefresh**](OkidokiArchitectureApiApi.md#postrefresh) | **POST** /api/auth/refresh | 
[**postRegister**](OkidokiArchitectureApiApi.md#postregister) | **POST** /api/auth/register | 
[**postResendConfirmationEmail**](OkidokiArchitectureApiApi.md#postresendconfirmationemail) | **POST** /api/auth/resendConfirmationEmail | 
[**postResetPassword**](OkidokiArchitectureApiApi.md#postresetpassword) | **POST** /api/auth/resetPassword | 


# **getInfo**
> InfoResponse getInfo()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();

try {
    final response = api.getInfo();
    print(response);
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->getInfo: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InfoResponse**](InfoResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mapIdentityApiApiAuthConfirmEmail**
> mapIdentityApiApiAuthConfirmEmail(userId, code, changedEmail)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();
final String userId = userId_example; // String | 
final String code = code_example; // String | 
final String changedEmail = changedEmail_example; // String | 

try {
    api.mapIdentityApiApiAuthConfirmEmail(userId, code, changedEmail);
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->mapIdentityApiApiAuthConfirmEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **code** | **String**|  | 
 **changedEmail** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **post2fa**
> TwoFactorResponse post2fa(twoFactorRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();
final TwoFactorRequest twoFactorRequest = ; // TwoFactorRequest | 

try {
    final response = api.post2fa(twoFactorRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->post2fa: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **twoFactorRequest** | [**TwoFactorRequest**](TwoFactorRequest.md)|  | 

### Return type

[**TwoFactorResponse**](TwoFactorResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postForgotPassword**
> postForgotPassword(forgotPasswordRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();
final ForgotPasswordRequest forgotPasswordRequest = ; // ForgotPasswordRequest | 

try {
    api.postForgotPassword(forgotPasswordRequest);
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->postForgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **forgotPasswordRequest** | [**ForgotPasswordRequest**](ForgotPasswordRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postInfo**
> InfoResponse postInfo(infoRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();
final InfoRequest infoRequest = ; // InfoRequest | 

try {
    final response = api.postInfo(infoRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->postInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **infoRequest** | [**InfoRequest**](InfoRequest.md)|  | 

### Return type

[**InfoResponse**](InfoResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postLogin**
> AccessTokenResponse postLogin(loginRequest, useCookies, useSessionCookies)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();
final LoginRequest loginRequest = ; // LoginRequest | 
final bool useCookies = true; // bool | 
final bool useSessionCookies = true; // bool | 

try {
    final response = api.postLogin(loginRequest, useCookies, useSessionCookies);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->postLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 
 **useCookies** | **bool**|  | [optional] 
 **useSessionCookies** | **bool**|  | [optional] 

### Return type

[**AccessTokenResponse**](AccessTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postRefresh**
> AccessTokenResponse postRefresh(refreshRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();
final RefreshRequest refreshRequest = ; // RefreshRequest | 

try {
    final response = api.postRefresh(refreshRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->postRefresh: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshRequest** | [**RefreshRequest**](RefreshRequest.md)|  | 

### Return type

[**AccessTokenResponse**](AccessTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postRegister**
> postRegister()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();

try {
    api.postRegister();
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->postRegister: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postResendConfirmationEmail**
> postResendConfirmationEmail(resendConfirmationEmailRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();
final ResendConfirmationEmailRequest resendConfirmationEmailRequest = ; // ResendConfirmationEmailRequest | 

try {
    api.postResendConfirmationEmail(resendConfirmationEmailRequest);
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->postResendConfirmationEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resendConfirmationEmailRequest** | [**ResendConfirmationEmailRequest**](ResendConfirmationEmailRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postResetPassword**
> postResetPassword(resetPasswordRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getOkidokiArchitectureApiApi();
final ResetPasswordRequest resetPasswordRequest = ; // ResetPasswordRequest | 

try {
    api.postResetPassword(resetPasswordRequest);
} on DioException catch (e) {
    print('Exception when calling OkidokiArchitectureApiApi->postResetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resetPasswordRequest** | [**ResetPasswordRequest**](ResetPasswordRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

