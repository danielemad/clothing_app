import '../../../home/data/models/product_model.dart';
import '../../domain/entities/cart_item.dart';

class CartItemModel {
  final ProductModel product;
  final int quantity;

  CartItemModel({required this.product, this.quantity = 1});

  factory CartItemModel.fromEntity(CartItem cartItem) => CartItemModel(
        product: ProductModel.fromEntity(cartItem.product),
        quantity: cartItem.quantity,
      );

  CartItem toEntity() => CartItem(
        product: product.toEntity(),
        quantity: quantity,
      );
} 