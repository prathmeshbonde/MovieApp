import 'package:flutter/material.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trendingmovies.dart';
import 'package:movie_app/widgets/trendingshows.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'components/text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List trendingTV = [];
  List topRatedMovies = [];
  List topTVShows = [];
  final String apikey = '6f009c4a09734ea2dd73a2633cfa71fb';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZjAwOWM0YTA5NzM0ZWEyZGQ3M2EyNjMzY2ZhNzFmYiIsInN1YiI6IjYxZWRhNWE4NzEzZWE2MDA0MjFmMGY5ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8fTZzM77UHReWvwkm5uwKEld7btzqZAUOkLxDvZh3aw';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: const ConfigLogger(showErrorLogs: true),
    );

    Map trendingMResult = await tmdbWithCustomLogs.v3.trending
        .getTrending(mediaType: MediaType.movie);
    Map trendingTVResult = await tmdbWithCustomLogs.v3.trending
        .getTrending(mediaType: MediaType.tv);
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map topTVResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingMResult['results'];
      trendingTV = trendingTVResult['results'];
      topRatedMovies = topRatedResult['results'];
      topTVShows = topTVResult['results'];
    });
    // print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const ModifiedText(
          text: 'Movie App',
          color: Colors.white,
          size: 25,
        ),
        // leading: Image(image: AssetImage('assets/images/logo.png'),),
        leading: const Icon(Icons.movie_creation_rounded, size: 40),
        backgroundColor: Colors.red.shade900,
      ),
      body: ListView(
        children: [
          TV(tv: topTVShows),
          TopRated(toprated: topRatedMovies),
          TrendingMovies(trending: trendingMovies),
          TrendingShows(trending: trendingTV),
        ],
      ),
    );
  }
}
