import 'package:dio/dio.dart';
import 'package:simple_movies_app/shared/components/constants.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://moviesdatabase.p.rapidapi.com',
        receiveDataWhenStatusError: true
      )
    );
  }

  static Future<Response> getData({required String path,Map<String,dynamic>? queryParameters,Options? options}){
    dio.options.headers={
      'X-RapidAPI-Key':apiKey,
      'X-RapidAPI-Host':hostName
    };
    return dio.get(
        path,
      queryParameters: queryParameters,
      options: options
    );
  }
}

