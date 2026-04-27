import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String? id;
  final String title;
  final String description;
  final String? imageBase64;
  final DateTime createdAt;

  Note({
    this.id,
    required this.title,
    required this.description,
    this.imageBase64,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  /// Create a Note from a Firestore document map
  factory Note.fromMap(String id, Map<String, dynamic> data) {
    return Note(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      imageBase64: data['image'] as String?,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  /// Convert Note to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': imageBase64 ?? '',
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
