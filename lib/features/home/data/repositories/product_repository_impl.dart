import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;
  ProductRepositoryImpl(this.localDataSource);

  @override
  List<Product> getProducts() {
    return localDataSource.getProducts().map((model) => model.toEntity()).toList();
  }
} 