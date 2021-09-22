import 'package:flutter/material.dart';

class MaterialSurface extends StatelessWidget {
  const MaterialSurface({final Key? key}) : super(key: key);
  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(8),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: const [
                  Card(
                    child: Text(
                      'default',
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Text(
                      'elevation: 10,',
                    ),
                  ),
                  GridTile(
                    child: SizedBox(
                      height: 100,
                      child: Text('data'),
                    ),
                    footer: GridTileBar(
                      title: Text('title'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: const [
                  ListTile(
                    title: Card(
                      child: Text(
                        'ListTile Card',
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'ListTile',
                    ),
                  ),
                  GridTile(
                    child: GridTileBar(
                      title: Text('title'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              const IconButton(
                icon: Icon(Icons.menu),
                onPressed: null,
              ),
              IconButton(
                icon: const Icon(Icons.not_accessible),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}
