import 'package:flutter/material.dart';
import 'package:grepmycloud_application/screens/bookshelfScreen.dart';
import 'package:grepmycloud_application/screens/createLinkScreen.dart';
import 'package:grepmycloud_application/screens/linksScreen.dart';
import 'package:grepmycloud_application/screens/welcomeScreen.dart';
import 'package:grepmycloud_application/models/linkCreator.dart';
import 'package:grepmycloud_application/models/linkPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GrepMyCloud());
}

class GrepMyCloud extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => LinkCreatorModel()),
        ChangeNotifierProxyProvider<LinkCreatorModel, LinkPageModel>(
          create: (context) => LinkPageModel(),
          update: (context, linkCreator, linkPage) {
            if (linkPage == null) throw ArgumentError.notNull('linkPage');
            linkPage.linkCreator = linkCreator;
            return linkPage;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Grep My Cloud',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomePage(), //TODO make this welcome
          '/myLinks': (context) => MyPages(),
          '/bookshelf': (context) =>
              BookshelfPage(), //TODO make this the bookshelf
          '/createLink': (context) => MyCustomForm(),
        },
      ),
    );
  }
}
