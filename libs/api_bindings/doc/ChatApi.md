# api_bindings.api.ChatApi

## Load the API package
```dart
import 'package:api_bindings/api.dart';
```

All URIs are relative to *http://api-dev.okidoki.fun*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteMessage**](ChatApi.md#deletemessage) | **DELETE** /api/Chat/{messageId} | 
[**editMessage**](ChatApi.md#editmessage) | **PATCH** /api/Chat/{messageId} | 
[**getMessages**](ChatApi.md#getmessages) | **GET** /api/Chat/Messages/{guildChannelId} | 
[**sendMessage**](ChatApi.md#sendmessage) | **POST** /api/Chat/{guildChannelId} | 


# **deleteMessage**
> deleteMessage(messageId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getChatApi();
final String messageId = messageId_example; // String | 

try {
    api.deleteMessage(messageId);
} on DioException catch (e) {
    print('Exception when calling ChatApi->deleteMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **messageId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **editMessage**
> ChatMessageDto editMessage(messageId, updateChatMessageRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getChatApi();
final String messageId = messageId_example; // String | 
final UpdateChatMessageRequest updateChatMessageRequest = ; // UpdateChatMessageRequest | 

try {
    final response = api.editMessage(messageId, updateChatMessageRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ChatApi->editMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **messageId** | **String**|  | 
 **updateChatMessageRequest** | [**UpdateChatMessageRequest**](UpdateChatMessageRequest.md)|  | 

### Return type

[**ChatMessageDto**](ChatMessageDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMessages**
> List<ChatMessageDto> getMessages(guildChannelId, cursor, direction)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getChatApi();
final String guildChannelId = guildChannelId_example; // String | 
final String cursor = cursor_example; // String | 
final QueryDirection direction = ; // QueryDirection | 

try {
    final response = api.getMessages(guildChannelId, cursor, direction);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ChatApi->getMessages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildChannelId** | **String**|  | 
 **cursor** | **String**|  | [optional] 
 **direction** | [**QueryDirection**](.md)|  | [optional] 

### Return type

[**List&lt;ChatMessageDto&gt;**](ChatMessageDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendMessage**
> ChatMessageDto sendMessage(guildChannelId, createChatMessageRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getChatApi();
final String guildChannelId = guildChannelId_example; // String | 
final CreateChatMessageRequest createChatMessageRequest = ; // CreateChatMessageRequest | 

try {
    final response = api.sendMessage(guildChannelId, createChatMessageRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ChatApi->sendMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildChannelId** | **String**|  | 
 **createChatMessageRequest** | [**CreateChatMessageRequest**](CreateChatMessageRequest.md)|  | 

### Return type

[**ChatMessageDto**](ChatMessageDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

