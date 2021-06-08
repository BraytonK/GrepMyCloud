import 'package:flutter/material.dart';
import 'package:grepmycloud_application/screens/bookshelfScreen.dart';
import 'package:grepmycloud_application/screens/linksScreen.dart';
import 'package:grepmycloud_application/screens/welcomeScreen.dart';

void main() {
  runApp(GrepMyCloud());
}

class GrepMyCloud extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grep My Cloud',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(), //TODO make this welcome
        '/myLinks': (context) => MyLinksPage(),
        '/bookshelf': (context) =>
            BookshelfPage(), //TODO make this the bookshelf
      },
    );
  }
}
