import 'package:flutter/material.dart';
import 'package:pizzeria_app/blocs/provider.dart';
import 'package:pizzeria_app/ui/pizzeria.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        home: new Pizzeria(),
      ),
    );
  }
}