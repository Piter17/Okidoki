# api_bindings.api.UserProfileApi

## Load the API package
```dart
import 'package:api_bindings/api.dart';
```

All URIs are relative to *http://okivps.polandcentral.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createUserProfile**](UserProfileApi.md#createuserprofile) | **POST** /api/UserProfile | 
[**getAllProfilesByUserId**](UserProfileApi.md#getallprofilesbyuserid) | **GET** /api/UserProfile/all | 
[**getByUserId**](UserProfileApi.md#getbyuserid) | **GET** /api/UserProfile/GetUserProfile | 
[**updateAvatar**](UserProfileApi.md#updateavatar) | **PATCH** /api/UserProfile/SetAvatar | 
[**updateProfile**](UserProfileApi.md#updateprofile) | **PATCH** /api/UserProfile/profile | 


# **createUserProfile**
> UserProfileDto createUserProfile(createUserProfileRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getUserProfileApi();
final CreateUserProfileRequest createUserProfileRequest = ; // CreateUserProfileRequest | 

try {
    final response = api.createUserProfile(createUserProfileRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserProfileApi->createUserProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserProfileRequest** | [**CreateUserProfileRequest**](CreateUserProfileRequest.md)|  | 

### Return type

[**UserProfileDto**](UserProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllProfilesByUserId**
> List<UserProfileDto> getAllProfilesByUserId()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getUserProfileApi();

try {
    final response = api.getAllProfilesByUserId();
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserProfileApi->getAllProfilesByUserId: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;UserProfileDto&gt;**](UserProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getByUserId**
> UserProfileDto getByUserId(userId, guildId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getUserProfileApi();
final String userId = userId_example; // String | 
final String guildId = guildId_example; // String | 

try {
    final response = api.getByUserId(userId, guildId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserProfileApi->getByUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 
 **guildId** | **String**|  | [optional] 

### Return type

[**UserProfileDto**](UserProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateAvatar**
> UserProfileDto updateAvatar(avatar)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getUserProfileApi();
final MultipartFile avatar = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.updateAvatar(avatar);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserProfileApi->updateAvatar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **avatar** | **MultipartFile**|  | [optional] 

### Return type

[**UserProfileDto**](UserProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProfile**
> UserProfileDto updateProfile(updateUserProfileRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getUserProfileApi();
final UpdateUserProfileRequest updateUserProfileRequest = ; // UpdateUserProfileRequest | 

try {
    final response = api.updateProfile(updateUserProfileRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserProfileApi->updateProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateUserProfileRequest** | [**UpdateUserProfileRequest**](UpdateUserProfileRequest.md)|  | 

### Return type

[**UserProfileDto**](UserProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

