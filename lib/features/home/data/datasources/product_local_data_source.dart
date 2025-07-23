import '../models/product_model.dart';
import "../../../../dummy_data/products.dart";

class ProductLocalDataSource {
  List<ProductModel> getProducts() {
    return products;
  }
} 