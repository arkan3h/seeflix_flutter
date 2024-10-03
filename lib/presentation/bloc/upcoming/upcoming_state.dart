import 'package:seeflix_flutter/domain/entities/movie.dart';

abstract class UpcomingState {}

class UpcomingInitial extends UpcomingState {}
class UpcomingLoading extends UpcomingState {}
class UpcomingSuccess extends UpcomingState {
  final List<Movie> movie;

  UpcomingSuccess(this.movie);
}
class UpcomingError extends UpcomingState {
  final String message;

  UpcomingError(this.message);
}