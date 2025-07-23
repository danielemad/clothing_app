import '../models/cart_item_model.dart';
import '../../../home/data/models/product_model.dart';

class CartLocalDataSource {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => List.unmodifiable(_items);

  void addToCart(ProductModel product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index] = CartItemModel(product: product, quantity: _items[index].quantity + 1);
    } else {
      _items.add(CartItemModel(product: product));
    }
  }

  void removeFromCart(ProductModel product) {
    _items.removeWhere((item) => item.product.id == product.id);
  }

  void increaseQuantity(ProductModel product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index] = CartItemModel(product: product, quantity: _items[index].quantity + 1);
    }
  }

  void decreaseQuantity(ProductModel product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1 && _items[index].quantity > 1) {
      _items[index] = CartItemModel(product: product, quantity: _items[index].quantity - 1);
    } else if (index != -1) {
      _items.removeAt(index);
    }
  }

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);
} 