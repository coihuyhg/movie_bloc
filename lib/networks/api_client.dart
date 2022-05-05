import 'package:dio/dio.dart';
import 'package:movie_bloc/model/detail_response.dart';
import 'package:movie_bloc/model/movie_response.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/3/discover/movie?api_key=26763d7bf2e94098192e629eb975dab0&page=1')
  Future<MovieResponse> getListMovie();

  @GET('https://api.themoviedb.org/3/movie/{movie_id}?api_key=26763d7bf2e94098192e629eb975dab0&page=1')
  Future<DetailResponse> getDetail(@Path("movie_id") String movieId);
}