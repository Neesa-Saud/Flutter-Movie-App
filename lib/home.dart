import 'package:flutter/material.dart';
import 'package:myapp/utils/text.dart';
import 'package:myapp/widgets/toprated..dart';
import 'package:myapp/widgets/trending.dart';
import 'package:myapp/widgets/tv.dart';
import 'package:myapp/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List upcomingmovies = [];
  final String apikey = 'efcca99183f3e41b7394efecc4f2c3de';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZmNjYTk5MTgzZjNlNDFiNzM5NGVmZWNjNGYyYzNkZSIsIm5iZiI6MTc0NTE0NTMyOS4wNDYwMDAyLCJzdWIiOiI2ODA0Y2RmMWUzZmFjMmY5MDI4OWQ0OGYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.R7N-6FAVbhe8a_fBkQVhzBbTF2SXa7VdiazQwVDj0Hw';
  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
      upcomingmovies = upcomingresult['results'];
    });
    print(trendingmovies);
  }

  void initState() {
    super.initState();
    loadmovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: ModifiedText(text: 'Movie App', color: Colors.black, size: 20),
        backgroundColor: Colors.yellow,
        bottomOpacity: 0.2,
      ),

      body: ListView(
        children: [
          TrendingMovies(trending: trendingmovies),
          TopRated(toprated: topratedmovies),
          TV(tv: tv),
          Upcoming(upcoming: upcomingmovies),
        ],
      ),
    );
  }
}
