import 'package:dartz/dartz.dart';
import 'package:seeflix_flutter/core/error/server_error.dart';
import 'package:seeflix_flutter/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  
  Future<Either<Failure, List<Movie>>> getPopular();

  Future<Either<Failure, List<Movie>>> getTopRated();

  Future<Either<Failure, List<Movie>>> getUpcoming();
}