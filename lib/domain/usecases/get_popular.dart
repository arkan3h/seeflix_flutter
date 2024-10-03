import 'package:dartz/dartz.dart';
import 'package:seeflix_flutter/core/error/server_error.dart';
import 'package:seeflix_flutter/domain/entities/movie.dart';
import 'package:seeflix_flutter/domain/repositories/movie_repository.dart';

class GetPopularMovie{
  final MovieRepository repository;
  
  GetPopularMovie(this.repository);

  Future<Either<Failure, List<Movie>>> call() async  {
    return await repository.getPopular();
  }
}