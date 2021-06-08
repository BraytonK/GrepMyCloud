import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookshelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                (BuildContext context, int index) => _MyShelf()),
          ),
        ],
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 150.0,
      flexibleSpace: const FlexibleSpaceBar(
        title: Text('Bookshelf'),
      ),
      //actions: [
      //  IconButton(
      //    icon: const Icon(Icons.menu_book_outlined),
      //    onPressed: () => Navigator.pushNamed(context, '/myLinks'),
      //  ),
      //]
    );
  }
}

class _MyShelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _MyBook(index)),
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
    return Container(
      alignment: Alignment.center,
      color: Colors.teal[100 * (index % 9)],
      child: Text('My Object $index'),
    );
  }
}
