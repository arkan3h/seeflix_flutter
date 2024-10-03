import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeflix_flutter/domain/usecases/get_popular.dart';
import 'package:seeflix_flutter/presentation/bloc/popular/popular_event.dart';
import 'package:seeflix_flutter/presentation/bloc/popular/popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final GetPopularMovie getPopularMovie;

  PopularBloc({required this.getPopularMovie}) : super(PopularInitial()) {
    on<FetchPopular>((event, emit) async {
      emit(PopularLoading());
      final data = await getPopularMovie();
      data.fold(
        (failure) => emit(PopularError(failure.toString())),
        (movie) => emit(PopularSuccess(movie))
      );
    });
  }
}
