import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grepmycloud/models/user.dart';
import 'package:grepmycloud/models/book.dart';
import 'package:provider/provider.dart';

class BookshelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userBooks = context.watch<UserModel>();
    //List<Widget> books = <Widget>[];
    //books.add(_MyBook(1));
    //books.add(_MyBook(2));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            // listDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200.0,
            //     mainAxisSpacing: 10.0,
            //     crossAxisSpacing: 10.0,
            //     childAspectRatio: 4.0),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  _MyBook(userBooks.books[index].id),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var user = context.read<UserModel>();
          user.setCurrentUserId(0);
          Navigator.pushNamed(context, '/createBook');
        },
        tooltip: 'Book Creator',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _book() {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      IconButton(
          icon: const Icon(Icons.link), tooltip: 'Book', onPressed: () {}),
      Text('Book')
    ]);
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 150.0,
      flexibleSpace: const FlexibleSpaceBar(
        title: Text('<User> Bookshelf'),
      ),
    );
  }
}

class _MyShelfOld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userBooks = context.watch<UserModel>();
    userBooks.add(new Book(1, "user book"), userBooks.getByCurrentId());
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _MyBook(userBooks.books[index].id),
                childCount: userBooks.books.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100.0,
                    child: Card(
                      child: Text('data'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyShelf extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets listPadding;
  final Widget divider;

  const _MyShelf(@required this.children, this.listPadding, this.divider,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext) {
    return Text("TESTTT");
  }
}

//This is a horizontal Sliver List that takes in an array
//TODO implement
class _MyShelfNew extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets listPadding;
  final Widget divider;

  const _MyShelfNew(@required this.children, this.listPadding, this.divider,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: listPadding,
          child: Row(children: [
            for (var i = 0; i < children.length; i++) ...[
              children[i],
              if (i != children.length - 1) addDivider(),
            ],
          ]),
        ),
      ),
    );
  }

  Widget addDivider() =>
      divider ?? Padding(padding: const EdgeInsets.symmetric(horizontal: 8));
}

//class _MyBook extends StatelessWidget {
//  final int index;
//  const _MyBook(this.index, {Key? key}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      color: Colors.white,
//      child: Center(
//        child: Ink(
//          decoration: const ShapeDecoration(
//            color: Colors.lightBlue,
//            shape: CircleBorder(),
//          ),
//          child: IconButton(
//            icon: const Icon(Icons.menu_book_outlined),
//            color: Colors.teal[100 * (index % 9)],
//            //child: Text('Book $index'),
//            onPressed: () => Navigator.pushNamed(context, '/myLinks'),
//          ),
//        ),
//      ),
//    );
//  }
//}
class _MyBook extends StatelessWidget {
  final int index;

  const _MyBook(this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      IconButton(
          icon: const Icon(Icons.book),
          tooltip: 'Opens: $index',
          onPressed: () => Navigator.pushNamed(context, '/book')),
      Text('$index')
    ]);
  }
}
