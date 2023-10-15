// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';

// ignore: non_constant_identifier_names
ProductModel ProductModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
Future<String> ProductModelToJson(ProductModel data) async =>
    json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isFavourite,
    this.qty,
  });

  String image;
  String id;
  bool isFavourite;
  String name;
  double price;
  String description;

  int? qty;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        qty: json["qty"],
        isFavourite: false,
        price: double.parse(json["price"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "isFavourite": isFavourite,
        "price": price,
        "qty": qty,
      };
  ProductModel copyWith({
    int? qty,
  }) =>
      ProductModel(
        id: id,
        name: name,
        description: description,
        image: image,
        isFavourite: isFavourite,
        qty: qty ?? this.qty,
        price: price,
      );
}
