import 'package:flutter/material.dart';
import 'package:grepmycloud_application/screens/User/SignedOutPortalScreen.dart';
import 'package:grepmycloud_application/screens/Book/bookshelfScreen.dart';
import 'package:grepmycloud_application/screens/Page/createLinkScreen.dart';
import 'package:grepmycloud_application/screens/User/googleSignInScreen.dart';
import 'package:grepmycloud_application/screens/Page/bookScreen.dart';
import 'package:grepmycloud_application/screens/User/apiSignInScreen.dart';
import 'package:grepmycloud_application/models/link.dart';
import 'package:grepmycloud_application/models/page.dart';
import 'package:grepmycloud_application/models/book.dart';

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
            bookPage.linkCreator = linkList;
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
          primarySwatch: Colors.lightBlue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SignedOutPortal(), //TODO make this welcome
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
