import 'package:dartz/dartz.dart';
import 'package:seeflix_flutter/core/error/server_error.dart';
import 'package:seeflix_flutter/data/datasources/movie_datasource.dart';
import 'package:seeflix_flutter/data/models/movie.dart';
import 'package:seeflix_flutter/domain/entities/movie.dart';
import 'package:seeflix_flutter/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource dataSource;

  MovieRepositoryImpl({required this.dataSource});
  
  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    try {
      final List<MovieModel> movieModel = await dataSource.getNowPlaying();
      final List<Movie> movie = movieModel.map((model) => model.toEntity()).toList();
      return Right(movie);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopular() async {
    try {
      final List<MovieModel> movieModel = await dataSource.getPopular();
      final List<Movie> movie = movieModel.map((model) => model.toEntity()).toList();
      return Right(movie);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRated() async {
    try {
      final List<MovieModel> movieModel = await dataSource.getTopRated();
      final List<Movie> movie = movieModel.map((model) => model.toEntity()).toList();
      return Right(movie);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcoming() async {
    try {
      final List<MovieModel> movieModel = await dataSource.getUpcoming();
      final List<Movie> movie = movieModel.map((model) => model.toEntity()).toList();
      return Right(movie);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}