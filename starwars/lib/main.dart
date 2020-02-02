import 'package:flutter/material.dart';
import 'package:starwars/movies.dart';
import 'package:starwars/swapi.dart';

void main() {
  var api = new Swapi().getMovies();
  api.then((m) => debugPrint(m.toString()));
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
