import 'package:flutter/material.dart';

class LinkModel {
  static List<String> allLinkNames = <String>[];
  static List<Link> allLinks = <Link>[];

  Link getById(int id) => Link(id, allLinkNames[id % allLinkNames.length]);

  Link getByPostition(int position) {
    return getById(position);
  }

  void add(String name) {
    allLinkNames.add(name);
  }

  void remove(String name) {
    allLinkNames.remove(name);
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
