class CartItem {
  final int id;
  final String name;
  final double price;

  CartItem({required this.id, required this.name, required this.price});

  // Convert a CartItem into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  // Convert a Map object into a CartItem
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      name: map['name'],
      price: map['price'],
    );
  }
}
