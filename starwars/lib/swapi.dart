import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:starwars/movies.dart';

class Swapi {
  Future<List<Movie>> getMovies() {
    var url = "https://swapi.co/api/films/?format=json";
    return http.get(url).then((response) {
      var content = json.decode(response.body);
      return List<Movie>.from(content['results'].map((el) {
        return Movie(el['title'], 1);
      }));
    });
  }
}
