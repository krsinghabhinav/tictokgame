class Note {
  final int? id;
  final String title;
  final String description;
  final String category;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.category,
  });

  // Convert a Note into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
    };
  }

  // Convert a Map object into a Note
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
    );
  }
}
