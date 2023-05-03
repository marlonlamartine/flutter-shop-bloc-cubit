import 'dart:developer';

import 'package:fake_api_shop/app/bloc/product/product_state.dart';

import 'package:fake_api_shop/app/repositories/products/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepository _repository;
  ProductCubit(this._repository) : super(ProductState.initial());

  Future<void> getProductById(int id) async {
    try {
      emit(state.copyWith(status: ProductStateStatus.loading));
      final product = await _repository.getProductDetail(id);

      emit(state.copyWith(status: ProductStateStatus.loaded, product: product));
    } catch (e, s) {
      log('Erro ao buscar produto', stackTrace: s);
      emit(
        state.copyWith(
            status: ProductStateStatus.error,
            errorMessage: 'Erro ao buscar produto - \n$e'),
      );
    }
  }
}
