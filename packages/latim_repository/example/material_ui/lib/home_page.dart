import 'package:flutter/material.dart';
import 'package:material_ui/material_buttons.dart';
import 'package:material_ui/material_forms.dart';
import 'package:material_ui/material_popups.dart';
import 'package:material_ui/material_surface.dart';

class HomePage extends StatelessWidget {
  const HomePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).backgroundColor,
      ),
      body: PageView(
        children: const <Widget>[
          MaterialPopups(),
          MaterialSurface(),
          MaterialForms(),
          MaterialButtons(),
        ],
      ));
}
