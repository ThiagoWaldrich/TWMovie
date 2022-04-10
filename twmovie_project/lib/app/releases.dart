import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:twmovie_project/information.dart';
import 'package:twmovie_project/utils/text.dart';
import 'package:twmovie_project/utils/title.dart';

class Releases extends StatelessWidget {
  final List movie_releases;

  const Releases({Key? key, required this.movie_releases}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_Title(text: "Releases", size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: movie_releases.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: movie_releases[index]['title'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    movie_releases[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    movie_releases[index]['poster_path'],
                                description: movie_releases[index]['overview'],
                                vote: movie_releases[index]['vote_average']
                                    .toString(),
                                launch_on: movie_releases[index]
                                    ['release_date'])));
                  },
                  child: Container(
                    width: 134,
                    child: Column(children: [
                      Container(
                        height: 185,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    movie_releases[index]['poster_path']),
                          ),
                        ),
                      ),
                      Container(
                        child: Modified_Text(
                            text: movie_releases[index]['title'] != null
                                ? movie_releases[index]['title']
                                : movie_releases[index]['original_name']),
                      ),
                    ]),
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
