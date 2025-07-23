import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../cubits/wishlist_cubit.dart";
import "../cubits/wishlist_states.dart";

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        final favItems = state.items.toSet().toList();
        if (favItems.isEmpty) {
          return const Center(child: Text('Your Wishlist is empty'));
        } else {
          return ListView.builder(
            itemCount: favItems.length,
            itemBuilder: (context, index) {
              final item = favItems[index];
              return ListTile(
                leading: Image.network(item.product.imageUrl,
                    width: 50, height: 50, fit: BoxFit.cover),
                title: Text(item.product.name),
                subtitle:
                    Text(' ${item.product.price.toStringAsFixed(2)}'),
              );
            },
                );
        }
      },
    );
  }
}
