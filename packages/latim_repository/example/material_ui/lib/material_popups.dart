import 'package:flutter/material.dart';

class MaterialPopups extends StatelessWidget {
  const MaterialPopups({final Key? key}) : super(key: key);
  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: const Text('Hello!'),
                      action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          }),
                    ),
                  );
              },
              child: const Text('Show SnackBar'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentMaterialBanner()
                  ..showMaterialBanner(
                    MaterialBanner(
                      content: const Text('Hello!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
              },
              child: const Text(
                'Show MaterialBanner',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Hello!'),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('show Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: const Text('Hello!'),
                      // color: Colors.blue,
                    );
                  },
                );
              },
              child: const Text('showModalBottomSheet'),
            ),
          ],
        ),
      );
}
