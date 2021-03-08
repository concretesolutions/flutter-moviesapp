class APIError implements Exception {
  final _message;
  final _prefix;

  APIError([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends APIError {
  FetchDataException([String message])
      : super(message, "Error During Sommunication: ");
}

class BadRequestException extends APIError {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends APIError {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class AuthenticationRequiredException extends APIError {
  AuthenticationRequiredException([message])
      : super(message, "Authentication Required: ");
}

class InvalidInputException extends APIError {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class ServerErrorException extends APIError {
  ServerErrorException([String message]) : super(message, "Server Error: ");
}
