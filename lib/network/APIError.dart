class APIError implements Exception {
  final String _message;
  final int _statusCode;

  APIError([this._message, this._statusCode]);

  String toString() {
    return "$_statusCode: $_message";
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
