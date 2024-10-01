import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeflix_flutter/domain/usecases/get_upcoming.dart';
import 'package:seeflix_flutter/presentation/bloc/upcoming/upcoming_event.dart';
import 'package:seeflix_flutter/presentation/bloc/upcoming/upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final GetUpcomingMovie getUpcomingMovie;

  UpcomingBloc({required this.getUpcomingMovie}) : super(UpcomingInitial()) {
    on<FetchUpcoming>((event, emit) async {
      emit(UpcomingLoading());
      final data = await getUpcomingMovie();
      data.fold(
        (failure) => emit(UpcomingError(failure.toString())),
        (movie) => emit(UpcomingSuccess(movie))
      );
    });
  }
}
