// A book is a list of pages
import 'package:flutter/material.dart';

@immutable
class Book {
  final int id;
  final String name;
  final Color color;

  List<int> pageIds = [];

  Book(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Book && other.id == id;

  void addPage(int id) {
    pageIds.add(id);
  }

  void removePage(int id) {
    pageIds.remove(id);
  }
}
