import 'package:flutter/material.dart';

class MyLinksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0),
            delegate:
                SliverChildBuilderDelegate((context, index) => _MyLink(index)),
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
        title: Text('My Objects'),
      ),
      //actions: [
      //  IconButton(
      //    icon: const Icon(Icons.menu_book_outlined),
      //    onPressed: () => Navigator.pushNamed(context, '/bookshelf'),
      //  ),
      //],
    );
  }
}

class _MyLink extends StatelessWidget {
  final int index;

  const _MyLink(this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.teal[100 * (index % 9)],
      child: Text('My Object $index'),
    );
  }
}
