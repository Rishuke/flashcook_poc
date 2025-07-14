class Menu {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final bool isAvailable;
  final String imageUrl;
  final List<String> tags;
  final DateTime createdAt;

  Menu({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.isAvailable,
    required this.imageUrl,
    required this.tags,
    required this.createdAt,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    try {
      return Menu(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: (json['price'] as num).toDouble(),
        category: json['category'],
        isAvailable: json['isAvailable'],
        imageUrl: json['imageUrl'],
        tags: List<String>.from(json['tags']),
        createdAt: DateTime.parse(json['createdAt']),
      );
    } catch (e) {
      throw Exception('Error parsing Menu from JSON: $e');
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'category': category,
        'isAvailable': isAvailable,
        'imageUrl': imageUrl,
        'tags': tags,
        'createdAt': createdAt.toIso8601String(),
      };

  String get fullMenu => '$title $description';
}
