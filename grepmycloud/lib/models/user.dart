// A user is a list of books
import 'package:flutter/material.dart';

@immutable
class User {
  final String name;
  final int id;
  final Color color;

  List<int> bookIds = [];

  User(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is User && other.id == id;

  void addBook(int id) {
    bookIds.add(id);
  }

  void removeBook(int id) {
    bookIds.remove(id);
  }
}
