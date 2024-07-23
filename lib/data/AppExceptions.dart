class AppException implements Exception {
  final String message;
  final String prefix;

  const AppException({required this.message, required this.prefix});

  @override
  String toString() {
    return "$prefix: $message";
  }
}

class InternetException extends AppException {
  const InternetException([String message = ""])
      : super(message: message, prefix: "No Internet");
}

class RequestTimeOut extends AppException {
  const RequestTimeOut([String message = ""])
      : super(message: message, prefix: "Request Time Out");
}

class ServerException extends AppException {
  const ServerException([String message = ""])
      : super(message: message, prefix: "ServerException");
}

class InvalidUrlException extends AppException {
  const InvalidUrlException([String message = ""])
      : super(message: message, prefix: "Invalid Url");
}

class FetchDataException extends AppException {
  const FetchDataException([String message = ""])
      : super(message: message, prefix: "");
}
