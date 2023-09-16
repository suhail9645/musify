import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musify/core/const/urls.dart';
import 'package:musify/model/failure.dart/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccessToken {
  Future<Either<Failure, String>> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> params = {
      'grant_type': 'client_credentials',
      'client_id': dotenv.env['CLINT_ID'],
      'client_secret': dotenv.env['CLINT_SECRET']
    };
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = "application/x-www-form-urlencoded";
    try {
      final response = await dio.post(accessTokenUrl, queryParameters: params);
      final access = response.data['access_token'];
      sharedPreferences.setString('accesskey', access);
      return Right(access);
    } on DioException catch (e) {
      return Left(Failure(errorMessage: e.message.toString()));
    }
  }
}
