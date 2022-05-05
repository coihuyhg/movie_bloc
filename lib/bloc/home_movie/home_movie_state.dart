part of 'home_movie_cubit.dart';

// ignore: must_be_immutable
class HomeMovieState extends Equatable {
  LoadStatus? loadStatus;
  MovieResponse? movie;

  HomeMovieState({this.loadStatus, this.movie});

  HomeMovieState copyWith({
    LoadStatus? loadStatus,
    MovieResponse? movie,
  }) {
    return HomeMovieState(
      loadStatus: loadStatus ?? this.loadStatus,
      movie: movie ?? this.movie,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    loadStatus,
    movie,
  ];
}
