import 'dart:html';

import 'package:flutter/material.dart';
import 'package:grepmycloud/models/page.dart';

class BookModel extends ChangeNotifier {
  late PageModel _pageList;
  static List<String> bookNames = <String>[];
  final List<int> _pages = [];
  int currentBookId = 0;

  PageModel get pageList => _pageList;

  set pageList(PageModel newPageList) {
    _pageList = newPageList;
    notifyListeners();
  }

  List<BookPage> get pages =>
      _pages.map((id) => _pageList.getById(id)).toList();

  Book getById(int id) => Book(id, bookNames[id % bookNames.length]);

  Book getByPosition(int position) {
    return getById(position);
  }

  Book getByCurrentId() {
    return getById(currentBookId);
  }

  void addBookName(String name) {
    bookNames.add(name);
  }

  void removeBookName(String name) {
    bookNames.remove(name);
  }

  int getLength(Book book) {
    return book.getLength();
  }

  void add(BookPage bookPage, Book book) {
    book.add(bookPage.id);
    //_pages.add(bookPage.id);
    //_pageList.add(bookPage.name);
    notifyListeners();
  }

  void remove(BookPage bookPage, Book book) {
    book.remove(bookPage.id);
    //_pageList.remove(bookPage.name);
    notifyListeners();
  }
}

class Book {
  final int id;
  final String name;
  final Color color;
  final List<int> pageIds = <int>[];

  Book(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  bool operator ==(Object other) => other is Book && other.id == id;

  void add(int id) {
    pageIds.add(id);
  }

  void remove(int id) {
    pageIds.remove(id);
  }

  int getLength() {
    return pageIds.length;
  }
}
