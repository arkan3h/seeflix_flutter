import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeflix_flutter/domain/usecases/get_top_rated.dart';
import 'package:seeflix_flutter/presentation/bloc/top_rated/top_rated_event.dart';
import 'package:seeflix_flutter/presentation/bloc/top_rated/top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final GetTopRatedMovie getTopRatedMovie;

  TopRatedBloc({required this.getTopRatedMovie}) : super(TopRatedInitial()) {
    on<FetchTopRated>((event, emit) async {
      emit(TopRatedLoading());
      final data = await getTopRatedMovie();
      data.fold(
        (failure) => emit(TopRatedError(failure.toString())),
        (movie) => emit(TopRatedSuccess(movie))
      );
    });
  }
}
