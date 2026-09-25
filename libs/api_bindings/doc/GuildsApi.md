# api_bindings.api.GuildsApi

## Load the API package
```dart
import 'package:api_bindings/api.dart';
```

All URIs are relative to *http://api-dev.okidoki.fun*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acceptInvitation**](GuildsApi.md#acceptinvitation) | **POST** /api/Guilds/invites/{invitationCode}/accept | 
[**assignRole**](GuildsApi.md#assignrole) | **PUT** /api/Guilds/roles/{roleId}/users/{userId} | 
[**createChannel**](GuildsApi.md#createchannel) | **POST** /api/Guilds/{guildId}/channels | 
[**createGuild**](GuildsApi.md#createguild) | **POST** /api/Guilds | 
[**createInvitation**](GuildsApi.md#createinvitation) | **POST** /api/Guilds/{guildId}/invites | 
[**createRole**](GuildsApi.md#createrole) | **POST** /api/Guilds/{guildId}/roles | 
[**getGuildById**](GuildsApi.md#getguildbyid) | **GET** /api/Guilds/{guildId} | 
[**getGuildsForUser**](GuildsApi.md#getguildsforuser) | **GET** /api/Guilds/user | 
[**getInvitation**](GuildsApi.md#getinvitation) | **GET** /api/Guilds/invites/{invitationCode} | 
[**kickUser**](GuildsApi.md#kickuser) | **DELETE** /api/Guilds/{guildId}/users/{userId} | 
[**leaveGuild**](GuildsApi.md#leaveguild) | **DELETE** /api/Guilds/{guildId}/membership | 
[**removeChannel**](GuildsApi.md#removechannel) | **DELETE** /api/Guilds/{guildId}/channels/{channelId} | 
[**removeRole**](GuildsApi.md#removerole) | **DELETE** /api/Guilds/roles/{roleId} | 
[**unassignRole**](GuildsApi.md#unassignrole) | **DELETE** /api/Guilds/roles/{roleId}/users/{userId} | 
[**updateImage**](GuildsApi.md#updateimage) | **PATCH** /api/Guilds/{guildId}/image | 
[**updateName**](GuildsApi.md#updatename) | **PATCH** /api/Guilds/{guildId}/name | 


# **acceptInvitation**
> GuildDto acceptInvitation(invitationCode)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String invitationCode = invitationCode_example; // String | 

try {
    final response = api.acceptInvitation(invitationCode);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->acceptInvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invitationCode** | **String**|  | 

### Return type

[**GuildDto**](GuildDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **assignRole**
> assignRole(roleId, userId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String roleId = roleId_example; // String | 
final String userId = userId_example; // String | 

try {
    api.assignRole(roleId, userId);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->assignRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **String**|  | 
 **userId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createChannel**
> GuildChannelDto createChannel(guildId, createGuildChannelRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String guildId = guildId_example; // String | 
final CreateGuildChannelRequest createGuildChannelRequest = ; // CreateGuildChannelRequest | 

try {
    final response = api.createChannel(guildId, createGuildChannelRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->createChannel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **String**|  | 
 **createGuildChannelRequest** | [**CreateGuildChannelRequest**](CreateGuildChannelRequest.md)|  | 

### Return type

[**GuildChannelDto**](GuildChannelDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createGuild**
> GuildDto createGuild(name, image)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String name = name_example; // String | 
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.createGuild(name, image);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->createGuild: $e\n');
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

# **createInvitation**
> GuildInvitationDto createInvitation(guildId, createGuildInvitationRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String guildId = guildId_example; // String | 
final CreateGuildInvitationRequest createGuildInvitationRequest = ; // CreateGuildInvitationRequest | 

try {
    final response = api.createInvitation(guildId, createGuildInvitationRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->createInvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **String**|  | 
 **createGuildInvitationRequest** | [**CreateGuildInvitationRequest**](CreateGuildInvitationRequest.md)|  | [optional] 

### Return type

[**GuildInvitationDto**](GuildInvitationDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createRole**
> GuildRoleDto createRole(guildId, createGuildRoleRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String guildId = guildId_example; // String | 
final CreateGuildRoleRequest createGuildRoleRequest = ; // CreateGuildRoleRequest | 

try {
    final response = api.createRole(guildId, createGuildRoleRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->createRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **String**|  | 
 **createGuildRoleRequest** | [**CreateGuildRoleRequest**](CreateGuildRoleRequest.md)|  | 

### Return type

[**GuildRoleDto**](GuildRoleDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGuildById**
> GuildDto getGuildById(guildId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String guildId = guildId_example; // String | 

try {
    final response = api.getGuildById(guildId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->getGuildById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **String**|  | 

### Return type

[**GuildDto**](GuildDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGuildsForUser**
> List<GuildProfileDto> getGuildsForUser()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();

try {
    final response = api.getGuildsForUser();
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->getGuildsForUser: $e\n');
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

# **getInvitation**
> GuildInvitationDto getInvitation(invitationCode)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String invitationCode = invitationCode_example; // String | 

try {
    final response = api.getInvitation(invitationCode);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->getInvitation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invitationCode** | **String**|  | 

### Return type

[**GuildInvitationDto**](GuildInvitationDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kickUser**
> kickUser(guildId, userId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String guildId = guildId_example; // String | 
final String userId = userId_example; // String | 

try {
    api.kickUser(guildId, userId);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->kickUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **String**|  | 
 **userId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **leaveGuild**
> leaveGuild(guildId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String guildId = guildId_example; // String | 

try {
    api.leaveGuild(guildId);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->leaveGuild: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeChannel**
> removeChannel(guildId, channelId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String guildId = guildId_example; // String | 
final String channelId = channelId_example; // String | 

try {
    api.removeChannel(guildId, channelId);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->removeChannel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **String**|  | 
 **channelId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeRole**
> removeRole(roleId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String roleId = roleId_example; // String | 

try {
    api.removeRole(roleId);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->removeRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unassignRole**
> unassignRole(roleId, userId)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String roleId = roleId_example; // String | 
final String userId = userId_example; // String | 

try {
    api.unassignRole(roleId, userId);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->unassignRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **String**|  | 
 **userId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateImage**
> GuildProfileDto updateImage(guildId, image)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String guildId = guildId_example; // String | 
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.updateImage(guildId, image);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->updateImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **String**|  | 
 **image** | **MultipartFile**|  | [optional] 

### Return type

[**GuildProfileDto**](GuildProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateName**
> GuildProfileDto updateName(guildId, updateGuildNameRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getGuildsApi();
final String guildId = guildId_example; // String | 
final UpdateGuildNameRequest updateGuildNameRequest = ; // UpdateGuildNameRequest | 

try {
    final response = api.updateName(guildId, updateGuildNameRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GuildsApi->updateName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guildId** | **String**|  | 
 **updateGuildNameRequest** | [**UpdateGuildNameRequest**](UpdateGuildNameRequest.md)|  | 

### Return type

[**GuildProfileDto**](GuildProfileDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

