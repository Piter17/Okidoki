import 'package:test/test.dart';
import 'package:api_bindings/api_bindings.dart';

/// tests for ExamplesApi
void main() {
  final instance = ApiBindings().getExamplesApi();

  group(ExamplesApi, () {
    //Future deleteid(int id) async
    test('test deleteid', () async {
      // TODO
    });

    //Future<List<ExampleDto>> getExamples() async
    test('test getExamples', () async {
      // TODO
    });

    //Future<ExampleDto> getid(int id) async
    test('test getid', () async {
      // TODO
    });

    //Future<ExampleDto> postExamples(CreateExampleRequest createExampleRequest) async
    test('test postExamples', () async {
      // TODO
    });

    //Future putid(int id, UpdateExampleRequest updateExampleRequest) async
    test('test putid', () async {
      // TODO
    });
  });
}
