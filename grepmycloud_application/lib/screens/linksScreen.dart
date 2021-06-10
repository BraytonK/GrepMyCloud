import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'package:provider/provider.dart';

class MyPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          MyLinksPage(
            title: 'Grep My Cloud',
            initialObjectCount: 0,
          ),
          MyLinksPage(
            title: 'Flutter Refs',
            initialObjectCount: 0,
          ),
        ],
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar('$title'),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MyLink(
                  'https://docs.google.com/document/d/1lB0U8TbGVYHeC3C3FcF2hzdkBvgaMsT7_yBpm6Lw_Nk/edit?usp=sharing',
                  'Documentation'),
              childCount: allObjectCount,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/createLink'),
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
