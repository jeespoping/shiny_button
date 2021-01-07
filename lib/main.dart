import 'package:flutter/material.dart';
import 'package:flutter_shiny_button/pages/main_shiny_buttons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shiny Buttons',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MainShinyButtons(),
      },
    );
  }
}
