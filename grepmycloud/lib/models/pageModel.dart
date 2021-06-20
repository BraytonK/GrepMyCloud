import 'package:flutter/foundation.dart';
import 'package:grepmycloud/models/link.dart';
import 'package:flutter/material.dart';

class PageModel extends ChangeNotifier {
  late LinkModel _linkList;
  final List<int> _links = [];
  static List<String> pageNames = <String>[];
  static List<int> pageIds = <int>[];
  int currentPageId = 1;
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

  BookPage getByCurrentId() {
    return getById(currentPageId);
  }

  void addPageName(String name) {
    pageNames.add(name);
  }

  void removePageName(String name) {
    pageNames.remove(name);
  }

  void setCurrentPageId(int pageId) {
    currentPageId = pageId;
  }

  void add(Link link, BookPage page) {
    page.add(link.id);
    _linkList.add(link.name);
    pageNames.add(page.name);
    notifyListeners();
  }

  void remove(Link link, BookPage page) {
    page.remove(link.id);
    _linkList.remove(link.name);
    pageNames.remove(page.name);
    notifyListeners();
  }
}

@immutable
class BookPage {
  final int id;

  final String name;

  final Color color;

  final List<int> linkIds = <int>[];

  BookPage(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is BookPage && other.id == id;

  void add(int id) {
    linkIds.add(id);
  }

  void remove(int id) {
    linkIds.remove(id);
  }
}
