import '../entities/cart_item.dart';
import '../../../home/domain/entities/product.dart';

abstract class CartRepository {
  List<CartItem> get items;
  void addToCart(Product product);
  void removeFromCart(Product product);
  void increaseQuantity(Product product);
  void decreaseQuantity(Product product);
  int get totalItems;
  double get totalPrice;
} 