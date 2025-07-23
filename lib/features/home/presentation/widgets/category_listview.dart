import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import 'product_card.dart';

class CategoryListview extends StatelessWidget{
  const CategoryListview({required this.categoryProducts , super.key });

  final List<Product> categoryProducts;


  


  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          final product = categoryProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product',
                arguments: product,
              );
            },
            child:ProductCard(product: product)
          );
        },
      ),
    );
  }
}