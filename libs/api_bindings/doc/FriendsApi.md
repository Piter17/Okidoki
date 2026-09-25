# api_bindings.api.FriendsApi

## Load the API package
```dart
import 'package:api_bindings/api.dart';
```

All URIs are relative to *http://api-dev.okidoki.fun*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acceptRequest**](FriendsApi.md#acceptrequest) | **PUT** /api/Friends/acceptRequest | 
[**declineRequest**](FriendsApi.md#declinerequest) | **PUT** /api/Friends/declineRequest | 
[**getFriends**](FriendsApi.md#getfriends) | **GET** /api/Friends | 
[**getReceivedRequestsAsync**](FriendsApi.md#getreceivedrequestsasync) | **GET** /api/Friends/receivedRequests | 
[**getSentRequestsAsync**](FriendsApi.md#getsentrequestsasync) | **GET** /api/Friends/sentRequests | 
[**revokeRequest**](FriendsApi.md#revokerequest) | **PUT** /api/Friends/revokeRequest | 
[**sendRequestById**](FriendsApi.md#sendrequestbyid) | **POST** /api/Friends/sendInviteById | 
[**sendRequestByUsername**](FriendsApi.md#sendrequestbyusername) | **POST** /api/Friends/sendInvite | 


# **acceptRequest**
> acceptRequest(senderId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getFriendsApi();
final String senderId = senderId_example; // String | 

try {
    api.acceptRequest(senderId);
} on DioException catch (e) {
    print('Exception when calling FriendsApi->acceptRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **senderId** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **declineRequest**
> declineRequest(senderId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getFriendsApi();
final String senderId = senderId_example; // String | 

try {
    api.declineRequest(senderId);
} on DioException catch (e) {
    print('Exception when calling FriendsApi->declineRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **senderId** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFriends**
> List<FriendDto> getFriends()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getFriendsApi();

try {
    final response = api.getFriends();
    print(response);
} on DioException catch (e) {
    print('Exception when calling FriendsApi->getFriends: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;FriendDto&gt;**](FriendDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getReceivedRequestsAsync**
> List<ReceivedRequestDto> getReceivedRequestsAsync()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getFriendsApi();

try {
    final response = api.getReceivedRequestsAsync();
    print(response);
} on DioException catch (e) {
    print('Exception when calling FriendsApi->getReceivedRequestsAsync: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;ReceivedRequestDto&gt;**](ReceivedRequestDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSentRequestsAsync**
> List<SentRequestDto> getSentRequestsAsync()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getFriendsApi();

try {
    final response = api.getSentRequestsAsync();
    print(response);
} on DioException catch (e) {
    print('Exception when calling FriendsApi->getSentRequestsAsync: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;SentRequestDto&gt;**](SentRequestDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeRequest**
> revokeRequest(targetId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getFriendsApi();
final String targetId = targetId_example; // String | 

try {
    api.revokeRequest(targetId);
} on DioException catch (e) {
    print('Exception when calling FriendsApi->revokeRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **targetId** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendRequestById**
> SentRequestDto sendRequestById(userId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getFriendsApi();
final String userId = userId_example; // String | 

try {
    final response = api.sendRequestById(userId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FriendsApi->sendRequestById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 

### Return type

[**SentRequestDto**](SentRequestDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendRequestByUsername**
> SentRequestDto sendRequestByUsername(username)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getFriendsApi();
final String username = username_example; // String | 

try {
    final response = api.sendRequestByUsername(username);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FriendsApi->sendRequestByUsername: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | [optional] 

### Return type

[**SentRequestDto**](SentRequestDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

