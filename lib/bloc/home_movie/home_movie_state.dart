part of 'home_movie_cubit.dart';

// ignore: must_be_immutable
class HomeMovieState extends Equatable {
  LoadStatus? loadStatus;
  MovieResponse? movie;
  Result? result;

  HomeMovieState({this.loadStatus, this.movie, this.result});

  HomeMovieState copyWith({
    LoadStatus? loadStatus,
    MovieResponse? movie,
    Result? result,
  }) {
    return HomeMovieState(
      loadStatus: loadStatus ?? this.loadStatus,
      movie: movie ?? this.movie,
      result: result ?? this.result,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    loadStatus,
    movie,
    result,
  ];
}
