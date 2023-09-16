import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:musify/model/failure.dart/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/const/urls.dart';
import 'access_token.dart';

class AllDataServiceImp {
  Future<Either<Failure, Response>> getDatasWithType(
      String type, String query) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString('accesskey');
    if (accessToken == null) {
      final accessKey = await AccessToken().getAccessToken();
      if (accessKey.isRight) {
        accessToken = accessKey.right;
      }
    }
    Map<String, dynamic> params = {
      'q': query,
      'type': type,
      'market': 'ML',
      'limit': 10,
      'offset': 5,
      'include_external': 'audio'
    };
    try {
      Dio dio = Dio();
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $accessToken';
          options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
          return handler.next(options);
        },
        onError: (e, handler) {
          return handler.next(e);
        },
      ));
      Response response = await dio.get(baseUrl, queryParameters: params);
      return Right(response);
    } on DioException catch (e) {
      return Left(
        Failure(
          errorMessage: e.message.toString(),
        ),
      );
    }
  }
}
