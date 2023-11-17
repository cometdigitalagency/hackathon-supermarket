import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:save_mart/config/routes/routes.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  AppRouter get routes => AppRouter();

  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';

    dio.options.connectTimeout = const Duration(seconds: 30);
    return dio;
  }

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
