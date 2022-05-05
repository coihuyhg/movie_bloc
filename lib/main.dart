import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/networks/api_client.dart';
import 'package:movie_bloc/networks/api_util.dart';
import 'package:movie_bloc/repositories/movie_repository.dart';

import 'bloc/home_movie/home_movie_cubit.dart';
import 'ui/home.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Movie',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late HomeMovieCubit cubit;
  late ApiClient _apiClient;

  @override
  void initState() {
    cubit = BlocProvider.of<HomeMovieCubit>(context);
    _apiClient = ApiUtil.instance.apiClient;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MovieRepository>(
          create: (context) {
            return MovieRepositoryImpl(_apiClient);
          },
        )
      ],
      child: BlocProvider<HomeMovieCubit>(
        create: (context) {
          final repository = RepositoryProvider.of<MovieRepository>(context);
          return HomeMovieCubit(repository);
        },
        child: Builder(
          builder: (context) {
            return BlocBuilder<HomeMovieCubit, HomeMovieState>(
              builder: (context, state) {
                return Home(state.movie!.results);
              },
            );
          },
        ),
      ),
    );
  }
}