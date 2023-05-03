import 'dart:developer';

import 'package:fake_api_shop/app/bloc/home/home_state.dart';
import 'package:fake_api_shop/app/models/product.dart';
import 'package:fake_api_shop/app/repositories/products/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductsRepository _repository;
  List<Product> productsList = [];
  HomeCubit(this._repository) : super(HomeState.initial());

  Future<void> loadProducts() async {
    try {
      emit(state.copyWith(status: HomeStateStatus.loading));
      final products = await _repository.getAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produtos', stackTrace: s);
      emit(
        state.copyWith(
            status: HomeStateStatus.error,
            errorMessage: 'Erro ao buscar produtos - \n$e'),
      );
    }
  }
}
