import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/detail_movie/detail_movie_cubit.dart';
import 'package:movie_bloc/bloc/home_movie/home_movie_cubit.dart';
import 'package:movie_bloc/repositories/movie_repository.dart';
import 'package:movie_bloc/ui/home/detail_movie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final HomeMovieCubit _cubit;

  @override
  // ignore: must_call_super
  void initState() {
    _cubit = BlocProvider.of<HomeMovieCubit>(context);
    // TODO: implement initState
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF2B5876), Color(0xFF4E4376)],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 64, top: 40, right: 64, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                        children: [
                          TextSpan(
                            text: 'Hello, ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'Jane!',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          )
                        ]),
                  ),
                  Image.asset(
                    'assets/icons/ic_bell.png',
                    width: 24,
                    height: 24,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 17, right: 17),
              width: width * 0.8,
              height: height * 0.06,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0x4D6B66A6), Color(0x4D75D1DD)],
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(width: 0.7, color: Colors.white)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/ic_search.png',
                    width: 22,
                    height: 22,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Color(0x80FFFFFF),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Image.asset('assets/icons/ic_line-vertical.png'),
                  SizedBox(
                    width: width * 0.028,
                  ),
                  Image.asset(
                    'assets/icons/ic_mic.png',
                    width: 16,
                    height: 22,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.026,
            ),
            SizedBox(
              width: width,
              height: 179,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      'Most Popular',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'BeVietnamPro-Regular',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Expanded(
                    child: BlocBuilder<HomeMovieCubit, HomeMovieState>(
                      bloc: _cubit,
                      buildWhen: (previous, current) =>
                          previous.loadStatus != current.loadStatus,
                      builder: (context, state) {
                        return Swiper(
                          onTap: (index) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BlocProvider<DetailMovieCubit>(
                                    create: (context) {
                                      final repository = RepositoryProvider.of<
                                          MovieRepository>(context);
                                      return DetailMovieCubit(
                                          repository,
                                          state.movie?.results[index].id
                                                  .toString() ??
                                              "");
                                    },
                                    child: const DetailMovie(),
                                  );
                                },
                              ),
                            );
                          },
                          itemBuilder: (context, index) {
                            return Container(
                                alignment: Alignment.topCenter,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image(
                                        image: CachedNetworkImageProvider(
                                          'https://image.tmdb.org/t/p/original${state.movie?.results[index].backdropPath}',
                                        ),
                                        height: 125,
                                        width: 328,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                        left: 35,
                                        top: 87,
                                        child: SizedBox(
                                          width: 139,
                                          height: 23,
                                          child: Text(
                                            '${state.movie?.results[index].title}',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFFFFFFFF),
                                                fontFamily:
                                                    'BeVietnamPro-Regular'),
                                          ),
                                        )),
                                    Positioned(
                                      left: 210,
                                      top: 92,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF7B6E35),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        width: 44,
                                        height: 14,
                                        child: Center(
                                          child: Text(
                                            '${state.movie?.results[index].voteAverage} ⭐',
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF000000),
                                                fontFamily:
                                                    'BeVietnamPro-Regular'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                          autoplay: true,
                          itemCount: state.movie?.results.length ?? 0,
                          viewportFraction: 0.7,
                          scale: 0.8,
                          pagination: const SwiperPagination(
                            margin: EdgeInsets.zero,
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              activeSize: 8,
                              size: 8,
                              color: Colors.grey,
                              activeColor: Color(0xFF738CD1),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              width: width,
              height: height * 0.12,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: selection.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8, left: 8),
                    width: width * 0.18,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x4DA6A1E0),
                            Color(0x4DA1F3FE),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('${selection[index]['img']}'),
                        SizedBox(
                          height: height * 0.011,
                        ),
                        Text(
                          '${selection[index]['title']}',
                          style: const TextStyle(
                              fontSize: 9,
                              fontFamily: 'BeVietnamPro-Regular',
                              color: Color(0xFFFFFFFF)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.035,
            ),
            SizedBox(
              width: width,
              height: height * 0.32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      'Upcoming releases',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'BeVietnamPro-Regular',
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Expanded(
                    child: BlocBuilder<HomeMovieCubit, HomeMovieState>(
                      bloc: _cubit,
                      buildWhen: (previous, current) =>
                          previous.loadStatus != current.loadStatus,
                      builder: (context, state) {
                        return Swiper(
                          onTap: (index) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BlocProvider<DetailMovieCubit>(
                                    create: (context) {
                                      final repository = RepositoryProvider.of<
                                          MovieRepository>(context);
                                      return DetailMovieCubit(
                                          repository,
                                          state.movie?.results[index].id
                                                  .toString() ??
                                              "");
                                    },
                                    child: const DetailMovie(),
                                  );
                                },
                              ),
                            );
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: CachedNetworkImageProvider(
                                    'https://image.tmdb.org/t/p/original${state.movie?.results[index].posterPath}',
                                  ),
                                  height: 200,
                                  width: 145,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                          autoplay: true,
                          itemCount: state.movie?.results.length ?? 0,
                          viewportFraction: 0.4,
                          scale: 0.5,
                          pagination: const SwiperPagination(
                            margin: EdgeInsets.zero,
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              activeSize: 8,
                              size: 8,
                              color: Colors.grey,
                              activeColor: Color(0xFF738CD1),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const List<Map<String, Object>> selection = [
  {'img': 'assets/icons/ic_genres.png', 'title': 'Genres'},
  {'img': 'assets/icons/ic_tv-series.png', 'title': 'TV series'},
  {'img': 'assets/icons/ic_movie-roll.png', 'title': 'Movies'},
  {'img': 'assets/icons/ic_cinema.png', 'title': 'In Theatre'},
];
