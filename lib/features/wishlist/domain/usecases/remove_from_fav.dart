import '../../../home/domain/entities/product.dart';
import '../repositories/whishlist_repo.dart';

class RemoveFromFav {
  WishListRepo wishListRepo;

  RemoveFromFav(this.wishListRepo);

  void call(Product product) {
    wishListRepo.removeFromFav(product);
  }
}
