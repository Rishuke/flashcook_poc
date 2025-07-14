import 'package:cloud_firestore/cloud_firestore.dart';

class Menu {
  final String id;
  final String title;
  final String description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Menu({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    try {
      return Menu(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        createdAt: (json['createdAt'] as Timestamp?)?.toDate(),
        updatedAt: (json['updatedAt'] as Timestamp?)?.toDate(),
      );
    } catch (e) {
      throw Exception('Error parsing Menu from JSON: $e');
    }
  }

  Menu copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return Menu(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'createdAt': Timestamp.fromDate(createdAt!),
        'updatedAt': Timestamp.fromDate(updatedAt!),
      };

  String get fullMenu => '$title $description';
}
