import "package:flutter/material.dart";

import "../../domain/entities/product.dart";
import "product_card.dart";


class ProductsGridview extends StatelessWidget{

  final List<Product> products;
  final String category;

  const ProductsGridview({required this.category ,required this.products  ,super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 3 : 2; // responsive columns

    return Scaffold(
      appBar: AppBar(title: Text("Category: $category")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.65, // Adjust this for better layout
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        ),
      ),
    );
  }
}
