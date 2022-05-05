import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc/model/movie_response.dart';
import 'package:movie_bloc/ui/detail_movie.dart';


class Home extends StatelessWidget {
  final List<Result> movies;

  const Home(this.movies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 64, top: 50, right: 64),
                height: height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Hello, ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'BeVietnamPro',
                          ),
                        ),
                        Text(
                          'Jane!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'BeVietnamPro',
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/ic_bell.png',
                      width: 24,
                      height: 24,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
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
                        child: Swiper(
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.topCenter,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DetailMovie(
                                        movieId: movies[index].id,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Image(
                                image: CachedNetworkImageProvider(
                                  'https://image.tmdb.org/t/p/original${movies[index].posterPath}',
                                ),
                                height: 130,
                                width: 328,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                      autoplay: true,
                      itemCount: movies.length,
                      viewportFraction: 0.8,
                      scale: 0.8,
                      pagination: const SwiperPagination(
                        margin: EdgeInsets.zero,
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          activeSize: 8,
                          size: 8,
                          color: Colors.grey,
                          activeColor: Colors.red,
                        ),
                      ),
                    )),
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
                      child: Swiper(
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.topCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailMovie(
                                          movieId:
                                              movies[index].id,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Image(
                                  image: CachedNetworkImageProvider(
                                    'https://image.tmdb.org/t/p/original${movies[index].posterPath}',
                                  ),
                                  height: 200,
                                  width: 145,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                        autoplay: true,
                        itemCount: movies.length,
                        viewportFraction: 0.4,
                        scale: 0.9,
                        pagination: const SwiperPagination(
                          margin: EdgeInsets.zero,
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                            activeSize: 8,
                            size: 8,
                            color: Colors.grey,
                            activeColor: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0xFF466289),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/ic_home.png'),
              iconSize: 29,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/ic_favorite.png'),
              iconSize: 29,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/ic_ticket.png'),
              iconSize: 29,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/ic_account.png'),
              iconSize: 29,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/ic_shuffle.png'),
              iconSize: 29,
            ),
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
