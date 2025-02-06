import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String? image;
   String ?priority;
  final String title;
  final String description;
  final DateTime timestamp;

  Task({
    this.image,
    required this.priority,
    required this.title,
    required this.description,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'priority': priority,
      'title': title,
      'description': description,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      image: map['image'],
      priority: map['priority'],
      title: map['title'],
      description: map['description'],
      timestamp:  (map['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}