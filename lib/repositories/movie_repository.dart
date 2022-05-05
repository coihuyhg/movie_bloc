import '../model/movie_response.dart';
import '../networks/api_client.dart';

abstract class MovieRepository {
  Future<MovieResponse>? getMovie();

  Future<MovieResponse>? getDetailMovie(int movieId);
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
  Future<MovieResponse> getDetailMovie(int movieId) async {
    return await _apiClient.getDetailMovie(movieId);
  }
}
