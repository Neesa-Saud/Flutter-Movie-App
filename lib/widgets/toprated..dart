import 'package:flutter/material.dart';
import 'package:myapp/description.dart';
import 'package:myapp/utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({super.key, this.toprated = const []});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Top Rated Movies', color: Colors.white, size: 20),
          SizedBox(height: 10),
          Container(
            height: 270,
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
                                name: toprated[index]['title'],
                                description: toprated[index]['overview'],
                                bannerurl:
                                    'http://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path'],
                                posterurl:
                                    'http://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
                                vote:
                                    toprated[index]['vote_average'].toString(),
                                launch_on: toprated[index]['release_date'],
                              ),
                        ),
                      );
                    },
                    // ignore: sort_child_properties_last
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: ModifiedText(
                              text:
                                  toprated[index]['title'] != null
                                      ? toprated[index]['title']
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
              itemCount: toprated.length,
            ),
          ),
        ],
      ),
    );
  }
}
