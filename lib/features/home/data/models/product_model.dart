import '../../domain/entities/product.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String color;
  final String size;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.size,
    required this.category,
  });

  // fromJson
  factory ProductModel.fromJson(Map<String , dynamic> json) => ProductModel(
        id: json["id"] ?? "defult id",
        name: json["name"] ?? "defult name" ,
        description: json["description"] ?? "defult description",
        price:json["price"] ?? 0.0,
        imageUrl: json["imageUrl"]  ?? "imageUrl",
        color:json["color"] ?? "red" ,
        size: json["size"] ?? "sm" ,
        category: json["category"] ?? "default category",
      );

  // toJson
  Map<String , dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "imageUrl": imageUrl,
    "color": color,
    "size": size,
    "category": category,
   };

  factory ProductModel.fromEntity(Product product) => ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        color: product.color,
        size: product.size,
        category: product.category,
      );

  Product toEntity() => Product(
        id: id,
        name: name,
        description: description,
        price: price,
        imageUrl: imageUrl,
        color: color,
        size: size,
        category: category,
      );
} 