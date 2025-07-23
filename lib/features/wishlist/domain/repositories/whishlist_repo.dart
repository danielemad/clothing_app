import '../../../home/domain/entities/product.dart';
import '../entities/wishlist_item.dart';

abstract class WishListRepo {
  List<WishListItem> get favItems;
  void addToFav(Product product);
  void removeFromFav(Product product);
}
