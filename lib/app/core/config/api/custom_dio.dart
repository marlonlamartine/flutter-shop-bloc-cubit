import 'package:dio/dio.dart';

final customDio = BaseOptions(
  baseUrl: 'https://fakestoreapi.com',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
);
