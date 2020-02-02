import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:starwars/movies.dart';

class Swapi {
  Future<List<Movie>> getMovies() {
    var url = "https://swapi.co/api/films/?format=json";
    return http.get(url).then((response) {
      var content = json.decode(response.body);
      var movies = List<Movie>.from(content['results'].map((el) {
        String title = el['title'];
        int release = int.parse(el['release_date'].split('-')[0]);

        return Movie(title, release);
      }));
      movies.sort((a, b) {
        return a.year - b.year;
      });
      return movies;
    });
  }
}
