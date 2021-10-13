import 'package:flutter/material.dart';
import 'package:grepmycloud/models/book.dart';

class BookDb extends ChangeNotifier {
  //This is representetive of the backend list of all users
  final List<String> _books = [
    "Grep My Cloud",
    "Laptop Shopping",
    "GFU - CSIS310"
  ];

  void addBookName(String bookName) {
    //Stacks the users (adds to the end of the list)
    _books.add(bookName);
  }

  //Gets the user by their id
  Book getById(int id) => Book(id, _books[id % _books.length]);
}
