import 'package:flutter/material.dart';
import 'package:grepmycloud/models/user.dart';

class UserDb extends ChangeNotifier {
  //This is representetive of the backend list of all users
  final List<String> _users = ["Brayton", "Josh", "Grant", "Jacob"];

  void addUser(String userName) {
    //Stacks the users (adds to the end of the list)
    _users.add(userName);
  }

  //Gets the user by their id
  User getById(int id) => User(id, _users[id % _users.length]);
}
