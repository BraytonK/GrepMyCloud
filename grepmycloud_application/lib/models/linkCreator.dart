import 'package:flutter/material.dart';

class LinkCreatorModel {
  static List<String> linkNames = [
    'link 1',
    'link 2',
    'link 3',
  ];
  Link getById(int id) => Link(id, linkNames[id % linkNames.length]);

  Link getByPostition(int position) {
    return getById(position);
  }
}

@immutable
class Link {
  final int id;
  final String name;
  final Color color;
  //TODO add url var?

  Link(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Link && other.id == id;
}
