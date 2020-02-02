import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starwars/movie_detail.dart';

class Movie {
  final String title;
  final int year;
  const Movie(this.title, this.year);
}

const movies = <Movie>[
  Movie('Star Wars: The New Hope', 1977),
  Movie('The Empire Strikes Back', 1980),
  Movie('Return of the Jedi', 1983),
  Movie('The Phantom Menace', 1999),
  Movie('Attack of the Clones', 2002),
  Movie('Revenge of the Sith', 2005),
  Movie('Star Wars: The Clone Wars', 2008),
  Movie('The Force Awakens', 2015),
  Movie('Rogue One', 2016),
  Movie('The Last Jedi', 2017),
  Movie('Solo', 2018),
  Movie('The Rise of Skywalker', 2019),
];

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
