import "package:equatable/equatable.dart";

import "../../domain/entities/wishlist_item.dart";

class WishListState extends Equatable {
  final List<WishListItem> items;

  const WishListState({required this.items});

  @override
  List<Object?> get props => [items];
}
