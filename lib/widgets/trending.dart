import 'package:flutter/material.dart';
import 'package:myapp/description.dart';
import 'package:myapp/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key, this.trending = const []});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Trending Movies', color: Colors.white, size: 20),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Description(
                                name: trending[index]['title'],
                                description: trending[index]['overview'],
                                bannerurl:
                                    'http://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                posterurl:
                                    'http://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                                launch_on: trending[index]['release_date'],
                              ),
                        ),
                      );
                    },
                    // ignore: sort_child_properties_last
                    child: Container(
                      width: 250,
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: ModifiedText(
                              text:
                                  trending[index]['title'] != null
                                      ? trending[index]['title']
                                      : 'Loading',
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    splashColor: Colors.grey,
                  ),
                );
              },
              itemCount: trending.length,
            ),
          ),
        ],
      ),
    );
  }
}
