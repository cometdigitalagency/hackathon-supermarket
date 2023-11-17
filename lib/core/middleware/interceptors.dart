// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

// import '../../configs/DI/config_dependencies.dart';
// import '../../configs/constants/api/api_constants.dart';
// import '../../configs/routes/routers.dart';
// import '../../configs/routes/routers.gr.dart';
// import '../../features/auth/data/datasource/login_local_data_source.dart';

// @Named('appInterceptors')
// @lazySingleton
// class AppInterceptors extends Interceptor {
//   final LoginLocalDataSource _localDataSource;

//   AppInterceptors(this._localDataSource);

//   @override
//   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     var token = await _localDataSource.getToken();

//     bool tokenHasExpired(String? token) {
//       if (token == null || token == "") {
//         return false;
//       } else {
//         return JwtDecoder.isExpired(token);
//       }
//     }

//     options.headers.addAll({"Accept-Language": "en"});

//     if (tokenHasExpired(token)) {
//       try {
//         final dio = Dio();
//         options.baseUrl = baseUrlApi;

//         options.headers.addAll({"Authorization": token});
//         final response = await dio.post(refreshTokenApi);
//         response.data['refreshToken'].toString();
//         await _localDataSource.saveToken(token: token);
//       } on DioException catch (err) {
//         await _localDataSource.deleteToken();
//         getIt<AppRouter>().replaceAll([LoginRoute()]);
//         return handler.reject(err);
//       }
//     }

//     return handler.next(options);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     handler.next(response);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     return handler.next(err);
//   }
// }
