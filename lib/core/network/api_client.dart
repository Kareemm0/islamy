import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../errors/server_exception.dart';

/// Thin HTTP client wrapper that handles UTF-8 decoding and status validation.
class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<Map<String, dynamic>> getJson(String url) async {
    final http.Response response;
    try {
      response = await _client.get(
        Uri.parse(url),
        headers: const {
          HttpHeaders.acceptHeader: 'application/json',
        },
      );
    } catch (e) {
      throw ServerException('Network error: $e');
    }

    if (response.statusCode != 200) {
      throw ServerException(
        'Request failed with status ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }

    final decoded = jsonDecode(utf8.decode(response.bodyBytes));
    if (decoded is! Map<String, dynamic>) {
      throw const ServerException('Unexpected JSON response format');
    }
    return decoded;
  }
}
