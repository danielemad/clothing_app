import '../../domain/entities/product.dart';

abstract class ProductState {}
class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductSuccess extends ProductState {
  final List<Product> products;
  ProductSuccess(this.products);
}
class ProductFailure extends ProductState {}