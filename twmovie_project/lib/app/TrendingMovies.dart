import 'dart:ffi';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:twmovie_project/Information.dart';
import 'package:twmovie_project/utils/text.dart';
import 'package:twmovie_project/utils/title.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_Title(text: "Mais assistidos", size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: trending[index]['title'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                description: trending[index]['overview'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                                launch_on: trending[index]['release_date'])));
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
                                    trending[index]['poster_path']),
                          ),
                        ),
                      ),
                      Container(
                        child: Modified_Text(
                            text: trending[index]['title'] != null
                                ? trending[index]['title']
                                : trending[index]['original_name']),
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
