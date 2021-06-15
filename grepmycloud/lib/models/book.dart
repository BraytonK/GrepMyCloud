/**import 'package:flutter/material.dart';
import 'package:grepmycloud_application/models/page.dart';

class BookModel extends ChangeNotifier {
  late PageModel _pageCreator;
  final List<int> _pages = [];

  PageModel get pageCreator => _pageCreator;

  set pageCreator(PageModel newPageCreator) {
    _pageCreator = newPageCreator;
    notifyListeners();
  }

  //TODO more accurately name 'page creator' for it is just a list of pages
  List<BookPage> get pages =>
      _pages.map((id) => _pageCreator.getById(id)).toList();

  void add(BookPage bookPage) {
    _pages.add(bookPage.id);
    //_pageCreator.add(bookPage.name);
    notifyListeners();
  }

  void remove(BookPage bookPage) {
    _pages.remove(bookPage.id);
    //_pageCreator.remove(bookPage.name);
    notifyListeners();
  }
}

class Book {}
**/