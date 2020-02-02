import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starwars/movie_detail.dart';
import 'package:starwars/swapi.dart';

class Movie {
  final String title;
  final int year;
  const Movie(this.title, this.year);
}

class Movies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieState();
  }
}

class MovieState extends State<Movies> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    var api = new Swapi().getMovies();
    api.then((m) {
      setState(() {
        movies = m;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return Align(
          alignment: Alignment.center, child: CircularProgressIndicator());
    }
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Align(
              alignment: Alignment.topLeft,
              child: Text(movies[index].title),
            ),
            subtitle: Text(movies[index].year.toString()),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetail(movies[index]))),
          );
        });
  }
}
