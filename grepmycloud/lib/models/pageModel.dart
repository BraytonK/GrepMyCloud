import 'package:flutter/foundation.dart';
import 'package:grepmycloud/models/linkModel.dart';
import 'package:flutter/material.dart';

class PageModel extends ChangeNotifier {
  late LinkModel _linkList;
  final List<int> _links = [];
  static List<String> allPageNames = <String>[];
  static List<int> pageIds = <int>[];
  int currentPageId = 1;
  LinkModel get linkList => _linkList;

  set linkList(LinkModel newLinkList) {
    _linkList = newLinkList;
    notifyListeners();
  }

  List<Link> get links => _links.map((id) => _linkList.getById(id)).toList();

  BookPage getById(int id) =>
      BookPage(id, allPageNames[id % allPageNames.length]);

  BookPage getByPostition(int position) {
    return getById(position);
  }

  BookPage getByCurrentId() {
    return getById(currentPageId);
  }

  void addPageName(String name) {
    allPageNames.add(name);
  }

  void removePageName(String name) {
    allPageNames.remove(name);
  }

  void setCurrentPageId(int pageId) {
    currentPageId = pageId;
  }

//TODO make this into two separate methods for adding a link to a page and adding a page to a book.
  void add(Link link, BookPage page) {
    page.add(link.id);
    _linkList.add(link.name);
    allPageNames.add(page.name);
    notifyListeners();
  }

  void remove(Link link, BookPage page) {
    page.remove(link.id);
    _linkList.remove(link.name);
    allPageNames.remove(page.name);
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
