import 'package:seeflix_flutter/domain/entities/movie.dart';

abstract class PopularState {}

class PopularInitial extends PopularState {}
class PopularLoading extends PopularState {}
class PopularSuccess extends PopularState {
  final List<Movie> movie;

  PopularSuccess(this.movie);
}
class PopularError extends PopularState {
  final String message;

  PopularError(this.message);
}