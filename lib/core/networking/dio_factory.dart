import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/shared_prefs_token_manager.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();

      dio!
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30);

      addDioHeaders(); // Add the headers
      addDioInterceptor(); // Add interceptors
    }
    return dio!;
  }

  static Future<void> addDioHeaders() async {
    final accessToken = await TokenManager.getAccessToken();
    dio?.options.headers = {
      'Authorization': 'Bearer $accessToken',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );

    // Add interceptor to handle token expiration
    dio?.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // Try refreshing the token
            final tokenRefreshed = await TokenManager.refreshAccessToken();
            if (tokenRefreshed) {
              // Retry the failed request with the new token
              final newAccessToken = await TokenManager.getAccessToken();
              final options = e.requestOptions;
              options.headers['Authorization'] = 'Bearer $newAccessToken';
              final retryResponse = await dio?.request(
                options.path,
                options: Options(
                  method: options.method,
                  headers: options.headers,
                ),
                data: options.data,
                queryParameters: options.queryParameters,
              );
              return handler.resolve(retryResponse!);
            }
          }
          return handler.next(e); // Pass the error if refresh fails
        },
      ),
    );
  }
}
