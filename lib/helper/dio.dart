import 'package:dio/dio.dart';

Dio dio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api/',
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      responseType: ResponseType.json,
    ),
  );

  return dio;
}
