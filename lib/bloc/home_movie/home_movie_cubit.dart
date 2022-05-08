import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/repositories/movie_repository.dart';

import '../../model/load_status.dart';
import '../../model/movie_response.dart';

part 'home_movie_state.dart';

class HomeMovieCubit extends Cubit<HomeMovieState> {
  MovieRepository movieRepository;

  HomeMovieCubit(this.movieRepository) : super(HomeMovieState());

  void init() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final result = await movieRepository.getMovie();
      if (result != null) {
        emit(state.copyWith(movie: result, loadStatus: LoadStatus.success));
      } else {
        emit(state.copyWith(movie: result, loadStatus: LoadStatus.failure));
      }
    } catch (e, s) {
      print('Huynq error: $e');
      print('Huynq stack trance: $s');
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }
}
