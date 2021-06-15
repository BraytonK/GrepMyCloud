import 'package:flutter/material.dart';
import 'package:grepmycloud/screens/User/SignedOutPortalScreen.dart';
import 'package:grepmycloud/screens/Book/bookshelfScreen.dart';
import 'package:grepmycloud/screens/Page/createLinkScreen.dart';
import 'package:grepmycloud/screens/User/googleSignInScreen.dart';
import 'package:grepmycloud/screens/Page/bookScreen.dart';
import 'package:grepmycloud/screens/User/apiSignInScreen.dart';
import 'package:grepmycloud/models/link.dart';
import 'package:grepmycloud/models/page.dart';
import 'package:grepmycloud/models/book.dart';

import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(GrepMyCloud());
}

class GrepMyCloud extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => LinkModel()),
        ChangeNotifierProxyProvider<LinkModel, PageModel>(
          create: (context) => PageModel(),
          update: (context, linkList, bookPage) {
            if (bookPage == null) throw ArgumentError.notNull('bookPage');
            bookPage.linkList = linkList;
            return bookPage;
          },
        ),
        /** Provider(create: (context) => PageModel()),
        ChangeNotifierProxyProvider<PageModel, BookModel>(
          create: (context) => BookModel(),
          update: (context, pageCreator, book) {
            if (book == null) throw ArgumentError.notNull('book');
            book.pageCreator = pageCreator;
            return book;
          },
        ),
**/
      ],
      child: MaterialApp(
        title: 'Grep My Cloud',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          primaryColor: Colors.yellow[100],
          accentColor: Colors.blueGrey,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => APISignInPage(), //TODO make this welcome
          '/apiSignIn': (context) => APISignInPage(),
          '/book': (context) => MyPages(),
          '/bookshelf': (context) =>
              BookshelfPage(), //TODO make this the bookshelf
          '/createLink': (context) => MyCustomForm(),
          '/googleSignIn': (context) => GoogleSignInPage(),
        },
      ),
    );
  }
}
