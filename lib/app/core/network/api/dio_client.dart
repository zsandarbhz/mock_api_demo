
import 'package:dio/dio.dart';

class DioClient {
  final String apiBaseUrl;

  DioClient({required this.apiBaseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    Dio dio = Dio(options);

    dio.interceptors.addAll(<Interceptor>[
      _loggingInterceptor(),
    ]);

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      options.headers.addAll({
        "Content-Type": "application/json",
      });
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioException err, handler) async {
      return handler.next(err);
    });
  }
}
