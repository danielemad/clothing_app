import '../../../home/data/models/product_model.dart';
import '../../domain/entities/wishlist_item.dart';

class WishListItemModel {
  final ProductModel product;

  WishListItemModel({required this.product});

  factory WishListItemModel.fromEntity(WishListItem item) => WishListItemModel(
        product: ProductModel.fromEntity(item.product),
      );

  WishListItem toEntity() => WishListItem(
        product: product.toEntity(),
      );
}
