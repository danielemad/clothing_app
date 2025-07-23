import "package:get_it/get_it.dart";
import "../features/cart/data/datasources/cart_local_data_source.dart";
import "../features/cart/data/repositories/cart_repository_impl.dart";
import "../features/cart/domain/repositories/cart_repository.dart";
import "../features/home/data/datasources/product_local_data_source.dart";
import "../features/home/data/repositories/product_repository_impl.dart";
import "../features/home/domain/repositories/product_repository.dart";
import "../features/wishlist/data/datasources/whistlist_local_datasource.dart";
import "../features/wishlist/data/repositories/wishlist_repo_impl.dart";
import "../features/wishlist/domain/repositories/whishlist_repo.dart";

GetIt sl = GetIt.instance;

Future<void> getInit() async{

  sl.registerSingleton<CartLocalDataSource>(CartLocalDataSource());
  sl.registerSingleton<CartRepository>(CartRepositoryImpl(sl<CartLocalDataSource>()));

  sl.registerSingleton<ProductLocalDataSource>(ProductLocalDataSource());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl<ProductLocalDataSource>()));

  sl.registerSingleton<WishListLocalDataSource>(WishListLocalDataSource());
  sl.registerSingleton<WishListRepo>(WishListRepoImpl(wishListLocalDataSource: sl<WishListLocalDataSource>()));
}