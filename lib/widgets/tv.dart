import 'package:flutter/material.dart';
import 'package:myapp/description.dart';
import 'package:myapp/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({super.key, this.tv = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Popular TV Shows',
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 270,
            child:
                tv.isEmpty
                    ? const Center(
                      child: Text(
                        'No TV Shows Available',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                    : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tv.length,
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
                                        name:
                                            tv[index]['original_name']
                                                ?.toString() ??
                                            'Unknown',
                                        description:
                                            tv[index]['overview']?.toString() ??
                                            'No description available',
                                        bannerurl:
                                            tv[index]['backdrop_path'] != null
                                                ? 'http://image.tmdb.org/t/p/w500${tv[index]['backdrop_path']}'
                                                : 'https://via.placeholder.com/500x300.png?text=No+Image', // Fallback image
                                        posterurl:
                                            tv[index]['poster_path'] != null
                                                ? 'http://image.tmdb.org/t/p/w500${tv[index]['poster_path']}'
                                                : 'https://via.placeholder.com/140x200.png?text=No+Image', // Fallback image
                                        vote:
                                            tv[index]['vote_average']
                                                ?.toString() ??
                                            'N/A',
                                        launch_on:
                                            tv[index]['release_date']
                                                ?.toString() ??
                                            'Unknown',
                                      ),
                                ),
                              );
                            },
                            splashColor: Colors.grey,
                            child: Container(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          tv[index]['poster_path'] != null
                                              ? 'http://image.tmdb.org/t/p/w500${tv[index]['poster_path']}'
                                              : 'https://via.placeholder.com/140x200.png?text=No+Image',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ModifiedText(
                                    text:
                                        tv[index]['original_name']
                                            ?.toString() ??
                                        'Loading',
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
