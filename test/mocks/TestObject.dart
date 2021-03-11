import 'package:moviesapp/network/Decodable.dart';

class TestObject implements Decodable {
  String title;

  @override
  Decodable fromJson(Map<String, dynamic> json) {
    title = json["title"];
    return this;
  }
}
