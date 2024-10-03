import 'package:seeflix_flutter/domain/entities/movie.dart';

abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}
class TopRatedLoading extends TopRatedState {}
class TopRatedSuccess extends TopRatedState {
  final List<Movie> movie;

  TopRatedSuccess(this.movie);
}
class TopRatedError extends TopRatedState {
  final String message;

  TopRatedError(this.message);
}