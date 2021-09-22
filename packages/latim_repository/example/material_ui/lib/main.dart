import 'package:flutter/material.dart';
import 'package:latim_repository/latim_repository.dart';
import 'package:material_ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material UI',
      theme: appThemeData(colorScheme: lightColorScheme),
      darkTheme: appThemeData(colorScheme: darkColorScheme),
      home: const HomePage(),
    );
  }
}
