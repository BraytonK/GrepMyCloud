import 'package:flutter/material.dart';
import 'package:grepmycloud/models/bookModel.dart';

class UserModel extends ChangeNotifier {
  late BookModel _bookList;
  final List<int> _books = [];
  static List<String> userNames = <String>[];
  int currentUserId = 1;

  BookModel get bookList => _bookList;

  set bookList(BookModel newBookList) {
    _bookList = newBookList;
    notifyListeners();
  }

  List<Book> get books => _books.map((id) => _bookList.getById(id)).toList();

  User getById(int id) => User(id, userNames[id % userNames.length]);

  void addUserName(String name) {
    userNames.add(name);
  }

  void removeUserName(String name) {
    userNames.remove(name);
  }

  User getByCurrentId() {
    return getById(currentUserId);
  }

  void setCurrentUserId(int id) {
    currentUserId = id;
  }

  void add(Book book, User user) {
    user.add(book.id);
    userNames.add(user.name);
    //_bookList.add(book.name);
    notifyListeners();
  }

  void remove(Book book, User user) {
    user.remove(book.id);
    userNames.remove(user.name);
    //_bookList.remove(book.name);
    notifyListeners();
  }
}

class User {
  final int id;
  final List<int> bookIds = <int>[];
  final String name;
  final Color color;

  User(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];
  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is User && other.id == id;

  void add(int id) {
    bookIds.add(id);
  }

  void remove(int id) {
    bookIds.remove(id);
  }
}
