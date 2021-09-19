import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({final Key? key}) : super(key: key);
  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text('Theme Page'),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                ],
              ),
              drawer: const Drawer(),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekly stats',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 50,
                      itemBuilder: (context, index) => Card(
                        child: GridTile(
                          child: Text('$index'),
                          footer: ElevatedButton(
                            onPressed: () {},
                            child: Text('a'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
            Scaffold(
              appBar: AppBar(
                title: const Text('Theme Page'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Elevated Button'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Outlined Button'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Text Button'),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(
                          value: 0.5,
                          minHeight: 5,
                        ),
                      ),
                      CircularProgressIndicator(),
                      Container(
                        color: Colors.blue,
                        padding: const EdgeInsets.all(20),
                        child: const TextField(
                          decoration: InputDecoration(
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.teal,
                        padding: const EdgeInsets.all(20),
                        child: TextFormField(),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.green,
                        child: const TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'hintText',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
            Scaffold(
              appBar: AppBar(),
              body: Center(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 50,
                  itemBuilder: (context, index) => GridTile(
                    child: Card(
                      //  shadowColor: Colors.red,
                      elevation: 24,
                      child: Text('$index'),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      tooltip: 'Open navigation menu',
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    IconButton(
                      tooltip: 'Search',
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    IconButton(
                      tooltip: 'Favorite',
                      icon: const Icon(Icons.favorite),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {},
                label: const Text('FAB'),
              ),
            ),
            Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.ac_unit,
                    ),
                  ),
                ],
              ),
              body: Container(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: 50,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      index.toString(),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton.small(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      );
}
