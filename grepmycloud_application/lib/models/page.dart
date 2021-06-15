import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:grepmycloud_application/models/link.dart';
import 'package:flutter/material.dart';

class PageModel extends ChangeNotifier {
  late LinkModel _linkList;
  final List<int> _links = [];
  static List<String> pageNames = <String>[];

  LinkModel get linkList => _linkList;

  set linkList(LinkModel newLinkList) {
    _linkList = newLinkList;
    notifyListeners();
  }

  List<Link> get links => _links.map((id) => _linkList.getById(id)).toList();

  BookPage getById(int id) => BookPage(id, pageNames[id % pageNames.length]);

  BookPage getByPostition(int position) {
    return getById(position);
  }

  void addPageName(String name) {
    pageNames.add(name);
  }

  void removePageName(String name) {
    pageNames.remove(name);
  }

  void add(Link link) {
    _links.add(link.id);
    _linkList.add(link.name);
    notifyListeners();
  }

  void remove(Link link) {
    _links.remove(link.id);
    _linkList.remove(link.name);
    notifyListeners();
  }
}

@immutable
class BookPage {
  final int id;

  final String name;

  final Color color;

  BookPage(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is BookPage && other.id == id;
}
