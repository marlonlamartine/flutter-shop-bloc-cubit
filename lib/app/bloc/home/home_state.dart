// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_api_shop/app/models/product.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState {
  final HomeStateStatus status;
  final List<Product> products;
  final String? errorMessage;
  HomeState({
    required this.status,
    required this.products,
    this.errorMessage,
  });

  HomeState.initial()
      : status = HomeStateStatus.initial,
        products = [],
        errorMessage = null;

  HomeState copyWith({
    HomeStateStatus? status,
    List<Product>? products,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
