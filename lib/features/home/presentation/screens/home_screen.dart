import 'package:clothing_app/features/home/presentation/widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/product_cubit.dart';
import '../cubits/product_state.dart';
import '../widgets/category_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          final products = state.products;
          final categories = products.map((p) => p.category).toSet().toList();
          return ListView(
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 180.0, autoPlay: true),
                items: products.take(5).map((product) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ...categories.map((category) {
                final categoryProducts = products
                    .where((p) => p.category == category)
                    .take(10)
                    .toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => ProductsGridview(
                                    products: products,
                                    category: category,
                                  )
                                )
                              );
                            }, 
                            child: Text("see all")
                          )
                        ],
                      ),
                    ),
                    CategoryListview(categoryProducts: categoryProducts)
                  ],
                );
              }),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
