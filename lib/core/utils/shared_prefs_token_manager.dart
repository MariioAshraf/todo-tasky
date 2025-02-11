import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  /// Retrieve the stored access token
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  /// Retrieve the stored refresh token
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  /// Save the new tokens
  static Future<void> saveTokens(
      {required String accessToken, required String refreshToken}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  /// Clear tokens when they are invalid
  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  }

  /// Refresh the access token using the refresh token
  static Future<bool> refreshAccessToken() async {
    final refreshToken = await TokenManager.getRefreshToken();

    if (refreshToken == null) return false;

    try {
      final dio = Dio();
      final response = await dio.get(
        'https://todo.iraqsapp.com/auth/refresh-token',
        queryParameters: {'token': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data[_accessTokenKey];
        await TokenManager.saveTokens(
          accessToken: newAccessToken,
          refreshToken: refreshToken,
        ); // Save the new tokens
        return true;
      } else {
        // Refresh token invalid (e.g., 403)
        await TokenManager.clearTokens();
        return false;
      }
    } catch (e) {
      // Handle network errors or other exceptions
      return false;
    }
  }
}
