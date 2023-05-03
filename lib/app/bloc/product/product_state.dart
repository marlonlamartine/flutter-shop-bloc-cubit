// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_api_shop/app/models/product.dart';

enum ProductStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProductState {
  final ProductStateStatus status;
  final Product? product;
  final String? errorMessage;
  ProductState({
    required this.status,
    required this.product,
    this.errorMessage,
  });

  ProductState.initial()
      : status = ProductStateStatus.initial,
        product = null,
        errorMessage = null;

  ProductState copyWith({
    final ProductStateStatus? status,
    final Product? product,
    final String? errorMessage,
  }) {
    return ProductState(
        status: status ?? this.status,
        product: product ?? this.product,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
