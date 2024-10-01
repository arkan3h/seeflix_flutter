import 'package:seeflix_flutter/data/models/movie.dart';

class MovieMapper {
  static MovieModel fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      imgUrl: json['poster_path'] ?? '',
    );
  }

  static List<MovieModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MovieMapper.fromJson(json)).toList();
  }
}