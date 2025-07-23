import '../repositories/cart_repository.dart';
import '../../../home/domain/entities/product.dart';

class DecreaseQuantity {
  final CartRepository repository;
  DecreaseQuantity(this.repository);

  void call(Product product) {
    repository.decreaseQuantity(product);
  }
} 