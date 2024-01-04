import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import 'package:sabowsla_server/core/network/api_response.dart';

abstract class CustomClient {
  Future<ApiResponse<T>> get<T>(
    String url, {
    Map<String, String>? headers,
  });

  Future<ApiResponse<T>> post<T>(
    String url, {
    required Map<String, dynamic> body,
    Map<String, String> headers,
    bool encodeBody = true,
    bool decodeResponse = true,
  });

  Future<ApiResponse<T>> put<T>(
    String url, {
    required Map<String, dynamic> body,
  });

  Future<ApiResponse<T>> delete<T>(
    String url, {
    Map<String, dynamic>? body,
  });

  Future<ApiResponse<T>> multipart<T>(
    String url, {
    required String filePath,
    required Uint8List imageBytes,
    Map<String, String> body,
  });
}

class HttpClientImpl extends CustomClient {
  HttpClientImpl({required this.client});

  final Client client;

  @override
  Future<ApiResponse<T>> get<T>(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      var response = await client.get(
        Uri.parse(url),
        headers: headers ?? _headers(),
      );
      return validateResponse(response);
    } catch (e) {
      return ApiResponse(success: false, message: '$e');
    }
  }

  @override
  Future<ApiResponse<T>> post<T>(
    String url, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    bool encodeBody = true,
    bool decodeResponse = true,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(url),
        body: encodeBody ? json.encode(body) : body,
        headers: headers ?? _headers(),
      );
      return validateResponse(response, decodeResponse);
    } on TimeoutException catch (_) {
      return ApiResponse(success: false, message: 'Timeout');
    } catch (e) {
      return ApiResponse(success: false, message: 'Error: $e');
    }
  }

  @override
  Future<ApiResponse<T>> put<T>(
    String url, {
    required Map<String, dynamic> body,
  }) async {
    try {
      var response = await client
          .put(
            Uri.parse(url),
            body: json.encode(body),
            headers: _headers(),
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: onTimeout,
          );

      return validateResponse(response);
    } on TimeoutException catch (_) {
      return ApiResponse(success: false, message: 'Timeout');
    } catch (e) {
      return ApiResponse(success: false, message: 'e');
    }
  }

  @override
  Future<ApiResponse<T>> delete<T>(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      var response = await client.delete(
        Uri.parse(url),
        body: body != null ? json.encode(body) : null,
        headers: _headers(),
      );

      return validateResponse(response);
    } catch (e) {
      return ApiResponse(success: false, message: 'e');
    }
  }

  @override
  Future<ApiResponse<T>> multipart<T>(
    String url, {
    required String filePath,
    required Uint8List imageBytes,
    Map<String, String>? body,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(_headers());

      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          imageBytes,
          filename: filePath,
          contentType: MediaType('image', 'png'),
        ),
      );

      if (body != null) {
        request.fields.addAll(body);
      }
      var response = await http.Response.fromStream(await request.send());
      return validateResponse(response);
    } catch (e) {
      return ApiResponse(success: false, message: 'e');
    }
  }

  Map<String, String> _headers() {
    return {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    };
  }

  FutureOr<Response> onTimeout() =>
      throw TimeoutException('{"error": "Timeout"}');
}

Future<ApiResponse<T>> validateResponse<T>(
  Response response, [
  bool decodeResponse = true,
]) async {
  bool success = false;
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      success = true;
      break;
    default:
      success = false;
  }
  dynamic body = decodeResponse ? json.decode(response.body) : response.body;
  return ApiResponse(success: success, message: "", data: body);
}
