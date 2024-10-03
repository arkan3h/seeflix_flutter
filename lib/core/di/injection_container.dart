import 'package:get_it/get_it.dart';
import 'package:seeflix_flutter/data/datasources/movie_datasource.dart';
import 'package:seeflix_flutter/data/datasources/network/movie_datasource_impl.dart';
import 'package:seeflix_flutter/data/repositories/movie_repository_impl.dart';
import 'package:seeflix_flutter/domain/repositories/movie_repository.dart';
import 'package:seeflix_flutter/domain/usecases/get_now_playing.dart';
import 'package:seeflix_flutter/domain/usecases/get_popular.dart';
import 'package:seeflix_flutter/domain/usecases/get_top_rated.dart';
import 'package:seeflix_flutter/domain/usecases/get_upcoming.dart';
import 'package:seeflix_flutter/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:seeflix_flutter/presentation/bloc/popular/popular_bloc.dart';
import 'package:seeflix_flutter/presentation/bloc/top_rated/top_rated_bloc.dart';
import 'package:seeflix_flutter/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance; 

void initializeDependencies() {
  getIt.registerSingleton(http.Client());

  getIt.registerSingleton<MovieDatasource>(MovieDatasourceImpl(client: getIt()));

  getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl(dataSource: getIt()));

  getIt.registerSingleton(GetNowPlayingMovie(getIt()));
  getIt.registerSingleton(GetPopularMovie(getIt()));
  getIt.registerSingleton(GetTopRatedMovie(getIt()));
  getIt.registerSingleton(GetUpcomingMovie(getIt()));

  getIt.registerFactory(() => NowPlayingBloc(getNowPlayingMovie: getIt()));
  getIt.registerFactory(() => PopularBloc(getPopularMovie: getIt()));
  getIt.registerFactory(() => TopRatedBloc(getTopRatedMovie: getIt()));
  getIt.registerFactory(() => UpcomingBloc(getUpcomingMovie: getIt()));
}