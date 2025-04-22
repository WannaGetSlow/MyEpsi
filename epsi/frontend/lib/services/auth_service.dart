import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String _baseUrl = 'http://127.0.0.1:8000/api/auth';

  Future<Map<String, dynamic>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/register/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e.toString());
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e.toString());
    }
  }

  Future<Map<String, dynamic>> resetPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/password-reset/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e.toString());
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }
    return {
      'success': false,
      'message': 'Server error: ${response.statusCode}',
    };
  }

  Map<String, dynamic> _handleError(String error) {
    return {
      'success': false,
      'message': 'Connection error: $error',
    };
  }
}