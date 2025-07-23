import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../cart/presentation/cubits/cart_cubit.dart";
import "../../domain/entities/product.dart";

class ProductCard extends StatelessWidget {

  const ProductCard({
    required this.product,
    super.key
  });

  final Product product;

  @override
  Widget build(BuildContext context){
    return AspectRatio(
      aspectRatio: 0.75,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(250),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                product.imageUrl,
                height: 100,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(product.price.toStringAsFixed(2)),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CartCubit>().addToCart(product);
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("your item has been added to cart"),
                              Spacer(),

                            ],
                          ),
                        )
                      )
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}