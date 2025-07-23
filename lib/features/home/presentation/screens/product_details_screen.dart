
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/cubits/cart_cubit.dart';
import '../../domain/entities/product.dart';
import '../widgets/fav_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          FavButton(product: product)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(product.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description),
            const SizedBox(height: 16),
            Row(
              children: [
                Text('Color: ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(product.color),
                const SizedBox(width: 16),
                Text('Size: ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(product.size),
              ],
            ),
            const SizedBox(height: 16),
            Text("Price: ${product.price.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18)),
            const Spacer(),
            SizedBox(
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
          ],
        ),
      ),
    );
  }
}
