
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/injections.dart';
import '../../domain/repositories/product_repository.dart';
import "product_state.dart";
import '../../domain/usecases/get_products.dart';



class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts = GetProducts(sl<ProductRepository>());
  ProductCubit() : super(ProductInitial()){
    loadProducts();
  }

  void loadProducts() {
    final products = getProducts();
    emit(ProductSuccess(products));
  }
} 