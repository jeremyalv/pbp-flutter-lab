import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class WatchlistAPI {
  Future<List<Movie>> fetchMovies() async {
    Uri url =
        Uri.parse("https://pbp-assignment-02.herokuapp.com/mywatchlist/json/");
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // Convert JSON data into Movie object
    List<Movie> movieList = [];

    for (var movie in data) {
      if (movie != null) {
        movieList.add(Movie.fromJson(movie["fields"]));
      }
    }

    return movieList;
  }
}
