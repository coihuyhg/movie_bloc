part of 'detail_movie_cubit.dart';

// ignore: must_be_immutable
class DetailMovieState extends Equatable {
  LoadStatus? loadStatus;
  DetailResponse? detail;

  DetailMovieState({this.loadStatus, this.detail});

  DetailMovieState copyWith({
    LoadStatus? loadStatus,
    DetailResponse? detail,
  }) {
    return DetailMovieState(
      loadStatus: loadStatus ?? this.loadStatus,
      detail: detail ?? this.detail,
    );
  }

  @override
  List<Object?> get props => [
        loadStatus,
        detail,
      ];
}
