import 'dart:html';

import 'package:flutter/material.dart';

class UserModel {}

class User {
  final int id;
  final List<Books> books = <Books>[];
  final String name;
  final Color color;

  User(this.id, this.name, this.books)
      : color = Colors.primaries[id % Colors.primaries.length];
  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is User && other.id == id;
}
