import 'package:seeflix_flutter/domain/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}
class NowPlayingLoading extends NowPlayingState {}
class NowPlayingSuccess extends NowPlayingState {
  final List<Movie> movie;

  NowPlayingSuccess(this.movie);
}
class NowPlayingError extends NowPlayingState {
  final String message;

  NowPlayingError(this.message);
}