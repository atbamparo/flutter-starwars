import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:starwars/movies.dart';

class Swapi {
  Future<List<Movie>> getMovies() async {
    var url = "https://swapi.co/api/films/?format=json";
    var response = await http.get(url);
    var jsonContent = json.decode(response.body);
    var movies = List<Movie>.from(jsonContent['results'].map((result) {
      String title = result['title'];
      int release = int.parse(result['release_date'].split('-')[0]);
      return Movie(title, release);
    }));
    movies.sort((a, b) => a.year.compareTo(b.year));
    return movies;
  }
}
