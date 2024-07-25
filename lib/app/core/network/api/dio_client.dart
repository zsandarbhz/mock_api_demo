
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
    // dio.options.headers['platform'] = _getPlatform();

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
      // if (GlobalDataStore.token != null) {
      //   options.headers.addAll({
      //     "Authorization": "Bearer ${GlobalDataStore.token}",
      //   });
      // }
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioException err, handler) async {
      return handler.next(err);
    });
  }
}
