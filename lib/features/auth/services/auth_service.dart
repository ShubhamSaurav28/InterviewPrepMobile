import 'package:dio/dio.dart';

import '../../../core/api/api_client.dart';
import '../../../core/storage/token_storage.dart';
import '../models/auth_response.dart';
import '../models/login_request.dart';

class AuthService {
  Future<AuthResponse> login(
      LoginRequest request) async {
    final response =
        await ApiClient.dio.post(
      '/auth/login',
      data: request.toJson(),
    );

    final authResponse =
        AuthResponse.fromJson(response.data);

    await TokenStorage.saveToken(
      authResponse.token,
    );

    return authResponse;
  }
}