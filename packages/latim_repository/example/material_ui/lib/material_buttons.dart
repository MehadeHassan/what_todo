import 'package:flutter/material.dart';

class MaterialButtons extends StatelessWidget {
  const MaterialButtons({final Key? key}) : super(key: key);
  void _onPressed() {}

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            ButtonBar(
              children: [
                const MaterialButton(
                  onPressed: null,
                  child: Text('MaterialButton'),
                ),
                MaterialButton(
                  onPressed: _onPressed,
                  child: const Text('MaterialButton'),
                ),
              ],
            ),
            ButtonBar(
              children: [
                const ElevatedButton(
                  onPressed: null,
                  child: Text('ElevatedButton'),
                ),
                ElevatedButton(
                  onPressed: _onPressed,
                  child: const Text('ElevatedButton'),
                ),
                ElevatedButton.icon(
                  onPressed: _onPressed,
                  label: const Text('ElevatedButton'),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            ButtonBar(
              children: [
                const OutlinedButton(
                  onPressed: null,
                  child: Text('OutlinedButton'),
                ),
                OutlinedButton(
                  onPressed: _onPressed,
                  child: const Text('OutlinedButton'),
                ),
                OutlinedButton.icon(
                  onPressed: _onPressed,
                  label: const Text('OutlinedButton'),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            ButtonBar(
              children: [
                const TextButton(
                  onPressed: null,
                  child: Text('TextButton'),
                ),
                TextButton(
                  onPressed: _onPressed,
                  child: const Text('TextButton'),
                ),
                TextButton.icon(
                  onPressed: _onPressed,
                  label: const Text('TextButton'),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            ButtonBar(
              children: [
                FloatingActionButton(
                  onPressed: _onPressed,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton.large(
                  onPressed: _onPressed,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton.small(
                  onPressed: _onPressed,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton.extended(
                  onPressed: _onPressed,
                  label: const Icon(Icons.add),
                ),
              ],
            ),
            ButtonBar(
              children: [
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: _onPressed,
                  icon: const Icon(Icons.add),
                ),
                const BackButton(
                  onPressed: null,
                ),
              ],
            ),
            ButtonBar(
              children: [
                ToggleButtons(
                  children: const [
                    Text('One'),
                    Text('Two'),
                    Text('Three'),
                  ],
                  isSelected: const [
                    true,
                    false,
                    false,
                  ],
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.grey,
          // selectedItemColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
        ),
      );
}
