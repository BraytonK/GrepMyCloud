import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grepmycloud/models/linkModel.dart';
import 'package:grepmycloud/models/pageModel.dart';
import 'package:grepmycloud/models/bookModel.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'package:provider/provider.dart';

class MyPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var books = context.watch<BookModel>();
    return Scaffold(
      body: PageView(
        children: <Widget>[MyLinksPage(title: 'test', initialObjectCount: 0)],
      ),
    );
  }
}
//   for (int i = 0; i < books.getLength(books.getById(0)); i++)
//     MyLinksPage(
//       title: books.getById(i).name,
//       initialObjectCount: 0,
//     ),
// ],

class MyLinksPage extends StatefulWidget {
  MyLinksPage({Key? key, required this.title, required this.initialObjectCount})
      : super(key: key);
  final String title;
  final int initialObjectCount;

  @override
  MyLinksPageState createState() => MyLinksPageState();
}

class MyLinksPageState extends State<MyLinksPage> {
  String link = '';
  String linkTitle = 'Unnamed';
  int allObjectCount = 0;
  int get initialObjectCount {
    return widget.initialObjectCount;
  }

  String get title {
    return widget.title;
  }

  int incrementObjectCount() {
    allObjectCount = allObjectCount + initialObjectCount + 1;
    return allObjectCount;
  }

  // I believe what I did here is try to make a widget that generates a page with
  // pre existing links
  @override
  Widget build(BuildContext context) {
    var pageLinks = context.watch<PageModel>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar('$title'),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          // This creates a grid of link widgets that are alled on by iterating
          // through the 'page links' list which should contain all of the
          // previously constructed links for that page
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MyLink(
                  pageLinks.links[index].name, pageLinks.links[index].name),
              childCount: pageLinks.links.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var page = context.read<PageModel>();
          //TODO make this non static
          page.setCurrentPageId(0);
          Navigator.pushNamed(context, '/createLink');
        },
        tooltip: 'Object Creator',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  final String title;
  const _MyAppBar(this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 150.0,
      title: Text('$title'),
    );
  }
}

class _MyLink extends StatelessWidget {
  final String link;
  final String title;
  const _MyLink(this.link, this.title, {Key? key}) : super(key: key);

  // This is the actual link object, This is called on in the previous method to
  // construct links on th epage
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      IconButton(
          icon: const Icon(Icons.link),
          tooltip: 'Opens: $link',
          onPressed: () {
            launchURL(link);
          }),
      Text('$title')
    ]);
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
