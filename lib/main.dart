import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/networks/api_client.dart';
import 'package:movie_bloc/networks/api_util.dart';
import 'package:movie_bloc/repositories/movie_repository.dart';
import 'package:movie_bloc/ui/main/main_ui.dart';

import 'bloc/home_movie/home_movie_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ApiClient _apiClient;

  @override
  void initState() {
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeMovieCubit>(
            create: (context) {
              final repository =
                  RepositoryProvider.of<MovieRepository>(context);
              return HomeMovieCubit(repository);
            },
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainUi(),
        ),
      ),
    );
  }
}
