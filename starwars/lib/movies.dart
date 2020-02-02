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
  Future<List<Movie>> _moviesLoader;

  @override
  void initState() {
    super.initState();
    var api = new Swapi();
    _moviesLoader = api.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: _moviesLoader,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildList(snapshot.data);
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error.toString()}');
        }

        return Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator()
        );
      }
    );
  }

  Widget _buildList(List<Movie> movies)
  {
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
