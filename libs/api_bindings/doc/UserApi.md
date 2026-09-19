# api_bindings.api.UserApi

## Load the API package
```dart
import 'package:api_bindings/api.dart';
```

All URIs are relative to *http://localhost:5088*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMe**](UserApi.md#getme) | **GET** /api/User | 
[**updateUsername**](UserApi.md#updateusername) | **PATCH** /api/User/SetUserName | 


# **getMe**
> IdentityDto getMe()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getUserApi();

try {
    final response = api.getMe();
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserApi->getMe: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**IdentityDto**](IdentityDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUsername**
> updateUsername(username)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getUserApi();
final String username = username_example; // String | 

try {
    api.updateUsername(username);
} on DioException catch (e) {
    print('Exception when calling UserApi->updateUsername: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

