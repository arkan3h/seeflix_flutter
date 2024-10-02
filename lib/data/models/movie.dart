import 'package:seeflix_flutter/domain/entities/movie.dart';

class MovieModel {
  final int id;
  final String imgUrl;

  MovieModel({required this.id, required this.imgUrl});

  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
        id: json['id'],
        imgUrl: json['poster_path']
    );
  }

  Movie toEntity() {
    return Movie(
      id: id, 
      imgUrl: imgUrl
    );
  }
}
