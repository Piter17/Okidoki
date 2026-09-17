# api_bindings.api.GuildApi

## Load the API package
```dart
import 'package:api_bindings/api.dart';
```

All URIs are relative to *http://pc:6080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteroleid**](GuildApi.md#deleteroleid) | **DELETE** /api/Guild/Role/{roleId} | 
[**deleteuserid**](GuildApi.md#deleteuserid) | **DELETE** /api/Guild/Role/{roleId}/{userId} | 
[**getGetguild**](GuildApi.md#getgetguild) | **GET** /api/Guild/getGuild | 
[**getGetguilds**](GuildApi.md#getgetguilds) | **GET** /api/Guild/getGuilds | 
[**getGetinvitation**](GuildApi.md#getgetinvitation) | **GET** /api/Guild/getInvitation | 
[**patchUpdateimage**](GuildApi.md#patchupdateimage) | **PATCH** /api/Guild/{guildId}/updateImage | 
[**patchUpdatename**](GuildApi.md#patchupdatename) | **PATCH** /api/Guild/{guildId}/updateName | 
[**postAcceptinvitation**](GuildApi.md#postacceptinvitation) | **POST** /api/Guild/acceptInvitation | 
[**postCreatechannel**](GuildApi.md#postcreatechannel) | **POST** /api/Guild/createChannel | 
[**postCreateguild**](GuildApi.md#postcreateguild) | **POST** /api/Guild/createGuild | 
[**postCreateinvitation**](GuildApi.md#postcreateinvitation) | **POST** /api/Guild/createInvitation | 
[**postRole**](GuildApi.md#postrole) | **POST** /api/Guild/Role | 
[**putroleid**](GuildApi.md#putroleid) | **PUT** /api/Guild/Role/{roleId} | 


# **deleteroleid**
> deleteroleid(roleId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final int roleId = 789; // int | 

try {
    api.deleteroleid(roleId);
} on DioException catch (e) {
    print('Exception when calling GuildApi->deleteroleid: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteuserid**
> deleteuserid(userId, roleId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final int userId = 789; // int | 
final int roleId = 789; // int | 

try {
    api.deleteuserid(userId, roleId);
} on DioException catch (e) {
    print('Exception when calling GuildApi->deleteuserid: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **roleId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGetguild**
> GuildDto getGetguild(id)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final int id = 789; // int | 

try {
    final response = api.getGetguild(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->getGetguild: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**GuildDto**](GuildDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGetguilds**
> List<GuildProfileDto> getGetguilds()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();

try {
    final response = api.getGetguilds();
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->getGetguilds: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;GuildProfileDto&gt;**](GuildProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGetinvitation**
> GuildProfileDto getGetinvitation(invitationCode)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final String invitationCode = invitationCode_example; // String | 

try {
    final response = api.getGetinvitation(invitationCode);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->getGetinvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invitationCode** | **String**|  | [optional] 

### Return type

[**GuildProfileDto**](GuildProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchUpdateimage**
> GuildProfileDto patchUpdateimage(guildId, image)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final int guildId = 789; // int | 
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.patchUpdateimage(guildId, image);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->patchUpdateimage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **int**|  | 
 **image** | **MultipartFile**|  | [optional] 

### Return type

[**GuildProfileDto**](GuildProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchUpdatename**
> GuildProfileDto patchUpdatename(guildId, name)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final int guildId = 789; // int | 
final String name = name_example; // String | 

try {
    final response = api.patchUpdatename(guildId, name);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->patchUpdatename: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **int**|  | 
 **name** | **String**|  | [optional] 

### Return type

[**GuildProfileDto**](GuildProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postAcceptinvitation**
> GuildDto postAcceptinvitation(invitationCode)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final String invitationCode = invitationCode_example; // String | 

try {
    final response = api.postAcceptinvitation(invitationCode);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->postAcceptinvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invitationCode** | **String**|  | [optional] 

### Return type

[**GuildDto**](GuildDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postCreatechannel**
> GuildChannelDto postCreatechannel(guildId, groupId, name, type)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final int guildId = 789; // int | 
final int groupId = 789; // int | 
final String name = name_example; // String | 
final ChannelType type = ; // ChannelType | 

try {
    final response = api.postCreatechannel(guildId, groupId, name, type);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->postCreatechannel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **int**|  | [optional] 
 **groupId** | **int**|  | [optional] 
 **name** | **String**|  | [optional] 
 **type** | [**ChannelType**](.md)|  | [optional] 

### Return type

[**GuildChannelDto**](GuildChannelDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postCreateguild**
> GuildDto postCreateguild(name, image)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final String name = name_example; // String | 
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.postCreateguild(name, image);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->postCreateguild: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | [optional] 
 **image** | **MultipartFile**|  | [optional] 

### Return type

[**GuildDto**](GuildDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postCreateinvitation**
> GuildInvitationDto postCreateinvitation(guildId, maxUses, validUntil)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final int guildId = 789; // int | 
final int maxUses = 56; // int | 
final DateTime validUntil = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = api.postCreateinvitation(guildId, maxUses, validUntil);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->postCreateinvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **int**|  | [optional] 
 **maxUses** | **int**|  | [optional] 
 **validUntil** | **DateTime**|  | [optional] 

### Return type

[**GuildInvitationDto**](GuildInvitationDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postRole**
> GuildRoleDto postRole(guildId, name)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final int guildId = 789; // int | 
final String name = name_example; // String | 

try {
    final response = api.postRole(guildId, name);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildApi->postRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **int**|  | [optional] 
 **name** | **String**|  | [optional] 

### Return type

[**GuildRoleDto**](GuildRoleDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **putroleid**
> putroleid(roleId, userId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildApi();
final int roleId = 789; // int | 
final int userId = 789; // int | 

try {
    api.putroleid(roleId, userId);
} on DioException catch (e) {
    print('Exception when calling GuildApi->putroleid: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **int**|  | 
 **userId** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

