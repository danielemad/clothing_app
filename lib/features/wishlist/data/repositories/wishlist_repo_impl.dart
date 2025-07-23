import '../../../home/data/models/product_model.dart';
import '../../../home/domain/entities/product.dart';
import '../../domain/entities/wishlist_item.dart';
import '../../domain/repositories/whishlist_repo.dart';
import '../datasources/whistlist_local_datasource.dart';

class WishListRepoImpl implements WishListRepo {
  WishListLocalDataSource wishListLocalDataSource;

  WishListRepoImpl({required this.wishListLocalDataSource});

  @override
  void addToFav(Product product) {
    wishListLocalDataSource.addToFav(ProductModel.fromEntity(product));
  }

  @override
  List<WishListItem> get favItems =>
      wishListLocalDataSource.items.map((item) => item.toEntity()).toList();

  @override
  void removeFromFav(Product product) {
    wishListLocalDataSource.removeFromFav(ProductModel.fromEntity(product));
  }
}
