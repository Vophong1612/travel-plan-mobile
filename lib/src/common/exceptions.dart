abstract class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, [this.code]);

  @override
  String toString() => 'AppException: $message';
}

class NetworkException extends AppException {
  const NetworkException(String message, [String? code]) : super(message, code);
}

class ServerException extends AppException {
  const ServerException(String message, [String? code]) : super(message, code);
}

class CacheException extends AppException {
  const CacheException(String message, [String? code]) : super(message, code);
} 

class ChatException extends AppException {
  const ChatException(String message, [String? code]) : super(message, code);
} 