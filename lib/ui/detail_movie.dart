import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/detail_movie/detail_movie_cubit.dart';
import 'package:movie_bloc/bloc/home_movie/home_movie_cubit.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({Key? key}) : super(key: key);

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  late final DetailMovieCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<DetailMovieCubit>(context);
    // TODO: implement initState
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<DetailMovieCubit, DetailMovieState>(
            buildWhen: (previous, current) =>
                previous.loadStatus != current.loadStatus,
            builder: (context, state) {
              return Image(
                image: CachedNetworkImageProvider(
                  'https://image.tmdb.org/t/p/original${state.detail?.posterPath ?? ''}',
                ),
                height: 634,
                width: 428,
                fit: BoxFit.fill,
              );
            },
          ),
          SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(top: 450),
                height: 431,
                width: width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF2B5876), Color(0xFF4E4376)],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: BlocBuilder<DetailMovieCubit, DetailMovieState>(
                  buildWhen: (previous, current) =>
                      previous.loadStatus != current.loadStatus,
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/icons/ic_line.png'),
                        Text(
                          state.detail?.title ?? '',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'BeVietnamPro',
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        const Text(
                          'The Dark World',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'BeVietnamPro',
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.027,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 61,
                              height: 23,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0x4DA6A1E0),
                                      Color(0x4DA1F3FE)
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: const Center(
                                child: Text(
                                  'Action',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'BeVietnamPro',
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 38,
                              height: 23,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0x4DA6A1E0),
                                      Color(0x4DA1F3FE)
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: const Center(
                                child: Text(
                                  '16+',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'BeVietnamPro',
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 73,
                              height: 23,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFF5C518),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'IMDb',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'BeVietnamPro',
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  Text(
                                    '8.5',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'BeVietnamPro',
                                      color: Color(0xFF000000),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 78,
                            ),
                            Image.asset(
                              'assets/icons/ic_share.png',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/icons/ic_favorite.png',
                              width: 24,
                              height: 24,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01685,
                        ),
                        Container(
                          width: 354,
                          height: 45,
                          margin: EdgeInsets.only(left: width * 0.05),
                          child: RichText(
                            text: const TextSpan(
                                text:
                                    'When the Dark Elves attempt to plunge the universe into darkness, Thor must embark on a perilous and personal journey that will reunite him with doctor Jane ... ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'BeVietnamPro',
                                  color: Color(0xBFFFFFFF),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'More',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'BeVietnamPro',
                                      color: Color(0xFFA1F3FE),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: width * 0.05, right: width * 0.05),
                          width: 328,
                          height: 141,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Cast',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'BeVietnamPro',
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                  Text(
                                    'See All',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'BeVietnamPro',
                                        color: Color(0xFFFFFFFF)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.016,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cast.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            '${cast[index]['img']}',
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            height: height * 0.009,
                                          ),
                                          Text(
                                            '${cast[index]['name']}',
                                            style: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'BeVietnamPro',
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.003,
                                          ),
                                          Text(
                                            '${cast[index]['nameFilm']}',
                                            style: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'BeVietnamPro',
                                              color: Color(0x80FFFFFF),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                )),
          ),
          Positioned(
            left: 50,
            child: SafeArea(
              bottom: false,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 24,
                  icon: Image.asset('assets/icons/ic_back.png')),
            ),
          ),
        ],
      ),
    );
  }
}

const List<Map<String, Object>> cast = [
  {
    'img': 'assets/icons/img_chris.png',
    'name': 'Chris\nHemsworth',
    'nameFilm': 'Thor'
  },
  {
    'img': 'assets/icons/img_natalie.png',
    'name': 'Natalie\nPortman',
    'nameFilm': 'Jane Foster'
  },
  {
    'img': 'assets/icons/img_tom.png',
    'name': 'Tom\nHiddleston',
    'nameFilm': 'Loki'
  },
  {
    'img': 'assets/icons/img_kat.png',
    'name': 'Kat\nDennings',
    'nameFilm': 'Darcy Lewis'
  },
  {
    'img': 'assets/icons/img_anthony.png',
    'name': 'Anthony\nHopkins',
    'nameFilm': 'Odin'
  },
];
