import '../repositories/cart_repository.dart';
import '../../../home/domain/entities/product.dart';

class AddToCart {
  final CartRepository repository;
  AddToCart(this.repository);

  void call(Product product) {
    repository.addToCart(product);
  }
} 