import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/model/detail_response.dart';
import 'package:movie_bloc/model/load_status.dart';
import 'package:movie_bloc/repositories/movie_repository.dart';

part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  MovieRepository detailRepository;
  String movieId;

  DetailMovieCubit(this.detailRepository, this.movieId) : super(DetailMovieState());

  void init() async {

    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final result = await detailRepository.getDetailMovie(movieId);
      print(result);
      if (result != null) {
        emit(state.copyWith(detail: result, loadStatus: LoadStatus.success));
      } else {
        emit(state.copyWith(detail: result, loadStatus: LoadStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }
}
