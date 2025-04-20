import 'package:flutter/material.dart';
import 'package:myapp/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;
  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerurl, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: ModifiedText(
                      text: '⭐ Average Rating - $vote',
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Positioned(
                    top: 2,
                    left: 2,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(text: name, color: Colors.white, size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(
                text: 'Releasing on $launch_on',
                color: Colors.white,
                size: 15,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                SizedBox(width: 3),
                Flexible(
                  child: Container(
                    child: ModifiedText(
                      text: description,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
