// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:fake_api_shop/app/core/config/api/custom_dio.dart';
import 'package:fake_api_shop/app/models/product.dart';

class ProductsRepository {
  final dio = Dio(customDio);

  Future<List<Product>> getAllProducts() async {
    try {
      Response response = await dio.get('/products');
      return (response.data as List).map((e) => Product.fromMap(e)).toList();
    } catch (e, s) {
      throw '$e - \n$s';
    }
  }

  Future<Product> getProductDetail(int id) async {
    try {
      Response response = await dio.get('/products/$id');
      final data = Product.fromMap(response.data);

      return data;
    } catch (e, s) {
      throw '$e - \n$s';
    }
  }
}
