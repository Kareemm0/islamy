/// Exception thrown when a remote HTTP request fails or returns a non-200 status.
class ServerException implements Exception {
  const ServerException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() =>
      statusCode == null ? message : 'ServerException($statusCode): $message';
}
