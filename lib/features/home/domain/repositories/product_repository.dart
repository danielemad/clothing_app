import '../entities/product.dart';

abstract class ProductRepository {
  List<Product> getProducts();
}