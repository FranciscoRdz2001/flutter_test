import 'dart:developer';

import 'package:flutter_test_work/core/app/constants.dart';
import 'package:flutter_test_work/domain/models/api/api_response_model.dart';
import 'package:http/http.dart' as http;

class AppApi {
  static const _successStatusCodes = [200, 201, 202, 203, 204];

  factory AppApi.instance() {
    return _instance;
  }

  AppApi._internal();

  static final AppApi _instance = AppApi._internal();

  Future<ApiResponseModel<T>> getMethod<T>({
    required T Function(dynamic json) fromJson,
    required String endpoint,
    required Map<String, String> headers,
  }) async {
    try {
      final uri = Uri.parse('${AppConstants.apiUrl}/$endpoint');
      final response = await http.get(uri, headers: headers);

      final statusCode = response.statusCode;
      if (_successStatusCodes.contains(statusCode)) {
        final json = response.body;
        final data = fromJson(json);
        return ApiResponseModel<T>(
          message: 'Success',
          statusCode: statusCode,
          isSuccess: true,
          data: data,
        );
      } else {
        return ApiResponseModel<T>(
          message: 'Error: $statusCode',
          statusCode: statusCode,
        );
      }
    } catch (e) {
      log('Error: $e');
      return ApiResponseModel<T>(
        message: 'Error: $e',
        statusCode: 500,
      );
    }
  }
}
