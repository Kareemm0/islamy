import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../errors/server_exception.dart';

/// Thin HTTP client wrapper that handles UTF-8 decoding and status validation.
class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<Object?> _getDecoded(String url) async {
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

    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  Future<Map<String, dynamic>> getJson(String url) async {
    final decoded = await _getDecoded(url);
    if (decoded is! Map<String, dynamic>) {
      throw const ServerException('Unexpected JSON object response format');
    }
    return decoded;
  }

  Future<List<dynamic>> getJsonList(String url) async {
    final decoded = await _getDecoded(url);
    if (decoded is! List<dynamic>) {
      throw const ServerException('Unexpected JSON list response format');
    }
    return decoded;
  }
}
