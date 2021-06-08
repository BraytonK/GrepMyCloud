import 'package:flutter/material.dart';

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
      home: MyObjectsPage(
        title: 'User Objects',
        objectCount: 0,
      ),
    );
  }
}

class MyObjectsPage extends StatefulWidget {
  MyObjectsPage({Key? key, required this.title, required this.objectCount})
      : super(key: key);

  final String title;
  int objectCount;

  @override
  _MyObjectsPageState createState() => _MyObjectsPageState();
}

class MyObject extends StatelessWidget {
  final int index;

  const MyObject(this.index, {Key? key}) : super(key: key);
}

class _MyObjectsPageState extends State<MyObjectsPage> {
  int get objectCount {
    return widget.objectCount;
  }

  set objectCount(int count) {
    widget.objectCount = count;
  }

  void incrementObjectCount() {
    objectCount = objectCount + 1;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: _buildMainPage(),
    );
  }

  Widget _buildPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: _buildObjectSilversList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => incrementObjectCount()),
        tooltip: 'Object Creator',
        child: const Icon(Icons.add),
      ),
    );
  }

  //Input ref: https://flutter.dev/docs/cookbook/forms/retrieve-input

  Widget _buildMainPage() {
    return PageView(
      children: [
        _buildPage(),
        _buildPage(),
        _buildPage(),
      ],
    );
  }

  Widget _buildObjectSilversList() {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        expandedHeight: 120.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Header'),
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: Text('My Object $index'),
            );
          },
          childCount: objectCount,
        ),
      ),
    ]);
  }
}
