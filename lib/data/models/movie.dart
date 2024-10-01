import 'package:seeflix_flutter/domain/entities/movie.dart';

class MovieModel {
  final String id;
  final String imgUrl;

  MovieModel({required this.id, required this.imgUrl});

  Movie toEntity() {
    return Movie(
      id: id, 
      imgUrl: imgUrl
    );
  }
}
