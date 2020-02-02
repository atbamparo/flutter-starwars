import 'package:flutter/material.dart';
import 'package:starwars/movies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Star Wars Filmes:')),
        body: Movies(),
      ),
    );
  }
}
