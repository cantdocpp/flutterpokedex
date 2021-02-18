import 'package:flutter/material.dart';
import 'package:flutterpokedex/pages/home.dart';
import 'package:flutterpokedex/pages/detail.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/detail': (context) => Detail(),
      },
    );
  }
}
