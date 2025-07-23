import '../repositories/cart_repository.dart';
import '../../../home/domain/entities/product.dart';

class IncreaseQuantity {
  final CartRepository repository;
  IncreaseQuantity(this.repository);

  void call(Product product) {
    repository.increaseQuantity(product);
  }
} 