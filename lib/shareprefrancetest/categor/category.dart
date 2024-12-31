class Category {
  final int? id;
  final String name;

  Category({this.id, required this.name});

  // Convert a Category into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Convert a Map object into a Category
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
    );
  }
}
