import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:twmovie_project/utils/text.dart';
import 'package:twmovie_project/utils/title.dart';
import 'package:twmovie_project/information.dart';

class TV extends StatelessWidget {
  final List most_popular_movies;

  const TV({Key? key, required this.most_popular_movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_Title(text: "Most popular movies", size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: most_popular_movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: most_popular_movies[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      most_popular_movies[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      most_popular_movies[index]['poster_path'],
                                  description: most_popular_movies[index]['overview'],
                                  vote: most_popular_movies[index]['vote_average'].toString(),
                                  launch_on: most_popular_movies[index]['release_date'])));
                    },
                    child: Container(
                        padding: EdgeInsets.all(3),
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          most_popular_movies[index]['backdrop_path'],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Modified_Text(
                                  text: most_popular_movies[index]['title'] != null
                                      ? most_popular_movies[index]['title']
                                      : 'Carregando...'),
                            )
                          ],
                        )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
