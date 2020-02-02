import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starwars/movies.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  const MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Text(movie.title),
    );
  }
}
