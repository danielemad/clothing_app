import '../../../home/domain/entities/product.dart';
import '../repositories/whishlist_repo.dart';

class AddToFav {
  WishListRepo wishListRepo;

  AddToFav(this.wishListRepo);

  void call(Product product) {
    wishListRepo.addToFav(product);
  }
}
