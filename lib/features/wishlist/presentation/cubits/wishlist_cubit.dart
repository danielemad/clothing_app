import "package:clothing_app/features/wishlist/domain/repositories/whishlist_repo.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../home/domain/entities/product.dart";
import "../../domain/usecases/add_to_fav.dart";
import "../../domain/usecases/remove_from_fav.dart";
import "wishlist_states.dart";
import '../../../../core/injections.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListState(items: []));

  final RemoveFromFav _remove = RemoveFromFav(sl<WishListRepo>());
  final AddToFav _add = AddToFav(sl<WishListRepo>());

  void addToFav(Product product) {
    _add(product);

    _refreshWishList();
  }

  void removeFromFav(Product product) {
    _remove(product);
    _refreshWishList();
  }

  bool isInList(Product product){
    final result = state.items.indexWhere((item)=> item.product.id == product.id);
    if(result != -1){
      return true;
    }
    else{
      return false;
    }
  }

  void _refreshWishList() {
    final wishListRepoImpl = sl<WishListRepo>();
    emit(WishListState(items: wishListRepoImpl.favItems));
  }
}
