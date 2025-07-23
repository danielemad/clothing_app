import '../../../home/data/models/product_model.dart';
import '../models/wishlist_model.dart';

class WishListLocalDataSource {
  List<WishListItemModel> _items = [];

  List<WishListItemModel> get items => _items;

  void addToFav(ProductModel product) {
    // final index = _items.indexWhere((item) => item.product.id == product.id);
    _items.add(WishListItemModel(product: product));
  }

  void removeFromFav(ProductModel product) {
    _items.removeWhere((item) => item.product.id == product.id);
  }
}
