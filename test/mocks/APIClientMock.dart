import 'package:moviesapp/network/APIClient.dart';
import 'package:moviesapp/network/APIError.dart';
import 'package:moviesapp/network/Result.dart';
import 'package:moviesapp/network/Decodable.dart';
import 'package:moviesapp/network/APIRequest.dart';

class APIClientMock implements APIClient {
  bool didCallRequest = false;
  bool didCallRequestDecodable = false;
  bool shouldReturnError = false;
  APIError apiErrorToReturn = APIError("Request failed", 500);
  Decodable decodableToReturn;
  APIRequest requestPassed;

  @override
  Future<Result> request(APIRequest request) async {
    didCallRequest = true;
    requestPassed = request;
    if (shouldReturnError) {
      return Result.error(apiErrorToReturn);
    } else {
      return Result.success("Successful request");
    }
  }

  @override
  Future<Result<Decodable>> requestDecodable(
      APIRequest request, Decodable type) async {
    didCallRequestDecodable = true;
    requestPassed = request;
    if (shouldReturnError) {
      return Result.error(apiErrorToReturn);
    } else {
      return Result.success(decodableToReturn);
    }
  }
}
