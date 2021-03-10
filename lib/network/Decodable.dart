import 'dart:convert';

abstract class Decodable {
  factory Decodable(Decodable type, String data) {
    Map<String, dynamic> mappingData = json.decode(data);
    return type.fromJson(mappingData);
  }

  Decodable fromJson(Map<String, dynamic> json);
}
