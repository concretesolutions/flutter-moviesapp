class APIError implements Exception {
  final String message;
  final int statusCode;

  APIError([this.message, this.statusCode]);

  String toString() {
    return "$statusCode: $message";
  }
}

class ClientErrorException extends APIError {
  ClientErrorException([String message, int statusCode])
      : super(message, statusCode);
}

class ServerErrorException extends APIError {
  ServerErrorException([String message, int statusCode])
      : super(message, statusCode);
}

class UndefinedErrorException extends APIError {
  UndefinedErrorException([String message, int statusCode])
      : super(message, statusCode);
}
