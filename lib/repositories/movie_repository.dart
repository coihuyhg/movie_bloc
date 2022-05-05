import 'package:movie_bloc/model/detail_response.dart';

import '../model/movie_response.dart';
import '../networks/api_client.dart';

abstract class MovieRepository {
  Future<MovieResponse>? getMovie();
  Future<DetailResponse>? getDetailMovie(String movieId);
}

class MovieRepositoryImpl extends MovieRepository {
  late ApiClient _apiClient;

  MovieRepositoryImpl(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  @override
  Future<MovieResponse>? getMovie() async {
    return await _apiClient.getListMovie();
  }

  @override
  Future<DetailResponse>? getDetailMovie(String movieId) async {
    return await _apiClient.getDetail(movieId);
  }
}
