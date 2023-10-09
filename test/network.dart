import 'package:flutter_test/flutter_test.dart';
import 'package:harry_potter_from_api/services/network_service.dart';

void main(){
  test("testing 1", (){
    final testing = Network.methodGet(api: Network.api);
    print(testing);
    expect(testing, isNotNull);
  });
}