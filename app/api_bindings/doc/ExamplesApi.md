# api_bindings.api.ExamplesApi

## Load the API package
```dart
import 'package:api_bindings/api.dart';
```

All URIs are relative to *http://localhost:5080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create**](ExamplesApi.md#create) | **POST** /api/Examples | 
[**delete**](ExamplesApi.md#delete) | **DELETE** /api/Examples/{id} | 
[**getAll**](ExamplesApi.md#getall) | **GET** /api/Examples | 
[**getById**](ExamplesApi.md#getbyid) | **GET** /api/Examples/{id} | 
[**update**](ExamplesApi.md#update) | **PUT** /api/Examples/{id} | 


# **create**
> ExampleDto create(createExampleRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getExamplesApi();
final CreateExampleRequest createExampleRequest = ; // CreateExampleRequest | 

try {
    final response = api.create(createExampleRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ExamplesApi->create: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createExampleRequest** | [**CreateExampleRequest**](CreateExampleRequest.md)|  | 

### Return type

[**ExampleDto**](ExampleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete**
> delete(id)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getExamplesApi();
final int id = 56; // int | 

try {
    api.delete(id);
} on DioException catch (e) {
    print('Exception when calling ExamplesApi->delete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAll**
> List<ExampleDto> getAll()



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getExamplesApi();

try {
    final response = api.getAll();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ExamplesApi->getAll: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;ExampleDto&gt;**](ExampleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getById**
> ExampleDto getById(id)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getExamplesApi();
final int id = 56; // int | 

try {
    final response = api.getById(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ExamplesApi->getById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ExampleDto**](ExampleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update**
> update(id, updateExampleRequest)



### Example
```dart
import 'package:api_bindings/api.dart';

final api = ApiBindings().getExamplesApi();
final int id = 56; // int | 
final UpdateExampleRequest updateExampleRequest = ; // UpdateExampleRequest | 

try {
    api.update(id, updateExampleRequest);
} on DioException catch (e) {
    print('Exception when calling ExamplesApi->update: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **updateExampleRequest** | [**UpdateExampleRequest**](UpdateExampleRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

