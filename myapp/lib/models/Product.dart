class Products {
  final String id;
  final String name;
  final double price;

  Products({
    required this.id,
    required this.name,
    required this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'] ?? 'Unnamed Product',
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}
