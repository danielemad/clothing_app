import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_local_data_source.dart';
import '../../../home/domain/entities/product.dart';
import '../../../home/data/models/product_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;
  CartRepositoryImpl(this.localDataSource);

  @override
  List<CartItem> get items => localDataSource.items.map((model) => model.toEntity()).toList();

  @override
  void addToCart(Product product) {
    localDataSource.addToCart(ProductModel.fromEntity(product));
  }

  @override
  void removeFromCart(Product product) {
    localDataSource.removeFromCart(ProductModel.fromEntity(product));
  }

  @override
  void increaseQuantity(Product product) {
    localDataSource.increaseQuantity(ProductModel.fromEntity(product));
  }

  @override
  void decreaseQuantity(Product product) {
    localDataSource.decreaseQuantity(ProductModel.fromEntity(product));
  }

  @override
  int get totalItems => localDataSource.totalItems;

  @override
  double get totalPrice => localDataSource.totalPrice;
} 