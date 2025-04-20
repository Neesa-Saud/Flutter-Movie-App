import 'package:flutter/material.dart';
import 'package:myapp/description.dart';
import 'package:myapp/utils/text.dart';

class Upcoming extends StatelessWidget {
  final List upcoming;
  const Upcoming({super.key, this.upcoming = const []});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Upcoming Movies', color: Colors.white, size: 20),
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
                                name: upcoming[index]['title'],
                                description: upcoming[index]['overview'],
                                bannerurl:
                                    'http://image.tmdb.org/t/p/w500' +
                                    upcoming[index]['backdrop_path'],
                                posterurl:
                                    'http://image.tmdb.org/t/p/w500' +
                                    upcoming[index]['poster_path'],
                                vote:
                                    upcoming[index]['vote_average'].toString(),
                                launch_on: upcoming[index]['release_date'],
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
                                      upcoming[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: ModifiedText(
                              text:
                                  upcoming[index]['title'] != null
                                      ? upcoming[index]['title']
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
              itemCount: upcoming.length,
            ),
          ),
        ],
      ),
    );
  }
}
