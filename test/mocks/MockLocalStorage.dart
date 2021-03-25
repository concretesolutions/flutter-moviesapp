import 'package:localstorage/localstorage.dart';
import 'package:mockito/mockito.dart';

class MockLocalStorage extends Mock implements LocalStorage {
  var didCallSetItem = false;

  @override
  Future<void> setItem(String key, value,
      [Object Function(Object nonEncodable) toEncodable]) {
    didCallSetItem = true;
  }
}
