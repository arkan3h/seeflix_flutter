import 'package:seeflix_flutter/data/models/movie.dart';

abstract class MovieDatasource {
  Future<List<MovieModel>> getNowPlaying();
  
  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getTopRated();

  Future<List<MovieModel>> getUpcoming();
}
