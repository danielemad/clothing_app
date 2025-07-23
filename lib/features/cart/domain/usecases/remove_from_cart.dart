import '../repositories/cart_repository.dart';
import '../../../home/domain/entities/product.dart';

class RemoveFromCart {
  final CartRepository repository;
  RemoveFromCart(this.repository);

  void call(Product product) {
    repository.removeFromCart(product);
  }
} 