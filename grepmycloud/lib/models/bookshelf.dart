import 'package:flutter/foundation.dart';
import 'package:grepmycloud/database/userDb.dart';
import 'package:grepmycloud/database/bookDb.dart';
import 'package:grepmycloud/models/user.dart';
import 'package:grepmycloud/models/book.dart';

class Bookshelf extends ChangeNotifier {
  // Imports the db handlers, these are not specific to a user
  //   therefore they give all the data in the database
  late UserDb _users;
  late BookDb _books;

  UserDb get users => _users;
  BookDb get books => _books;

  set users(UserDb newUserDb) {
    _users = newUserDb;
    notifyListeners();
  }

  set books(BookDb newBookDb) {
    _books = newBookDb;
    notifyListeners();
  }

  // Var used to store the current user
  late User _currentUser;

  // TODO Hard setting the current user
  _currentUser = users.getById(1);

  // The current users books
  final List<int> _bookIds = [];

  // Returns a list of the books that the current user owns
  List<Book> get currentUserBooks =>
      _currentUser.bookIds.map((id) => _books.getById(id)).toList();

  // Adds [book] to the shelf
  // This allows for modification to the shelf from the outside
  void add(Book book) {
    _bookIds.add(book.id);
    notifyListeners();
  }

  // Removes [book] from the shelf
  void remove(Book book) {
    _bookIds.remove(book.id);
    notifyListeners();
  }
}
