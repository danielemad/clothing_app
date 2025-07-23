import '../../../home/domain/entities/product.dart';

class CartItem {
   Product product;
   int quantity;

   CartItem({required this.product, this.quantity = 1});
} 