import 'package:dio/dio.dart';
import 'api_client.dart';
import 'api_interceptors.dart';

class ApiUtil {
  late Dio dio;
  late ApiClient apiClient;

  ApiUtil._privateContructor() {
    dio = Dio();
    dio.options.connectTimeout = 15000;
    dio.interceptors.add(ApiInterceptors());
    apiClient = ApiClient(dio, baseUrl: "https://api.themoviedb.org");
  }

  static final ApiUtil instance = ApiUtil._privateContructor();
}
