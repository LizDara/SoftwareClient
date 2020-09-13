import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  String name;
  double price;
  String detail;

  Product({
    this.id,
    this.name,
    this.price,
    this.detail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "detail": detail,
      };
}
