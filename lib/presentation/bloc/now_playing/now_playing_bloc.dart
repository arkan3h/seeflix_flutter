import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeflix_flutter/domain/usecases/get_now_playing.dart';
import 'package:seeflix_flutter/presentation/bloc/now_playing/now_playing_event.dart';
import 'package:seeflix_flutter/presentation/bloc/now_playing/now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final GetNowPlayingMovie getNowPlayingMovie;

  NowPlayingBloc({required this.getNowPlayingMovie}) : super(NowPlayingInitial()) {
    on<FetchNowPlaying>((event, emit) async {
      emit(NowPlayingLoading());
      final data = await getNowPlayingMovie();
      data.fold(
        (failure) => emit(NowPlayingError(failure.toString())),
        (movie) => emit(NowPlayingSuccess(movie))
      );
    });
  }
}
