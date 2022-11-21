import 'dart:convert';

// List<Movie> moviesFromJson(String str) =>
//     List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

// String movieToJson(List<Movie> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  late String title;
  late String releaseDate;
  late double rating;
  late bool watched;
  late String review;

  Movie({
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.watched,
    required this.review,
  });

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> movieJson = <String, dynamic>{};
      movieJson["title"] = title;
      movieJson["release_date"] = releaseDate;
      movieJson["watched"] = watched;
      movieJson["rating"] = rating;
      movieJson["review"] = review;

      return movieJson;
    }

  Movie.fromJson(Map<String, dynamic> json) {
      title = json["title"];
      releaseDate = json["release_date"];
      watched = json["watched"];
      rating = json["rating"];
      review = json["review"];
  }
}
