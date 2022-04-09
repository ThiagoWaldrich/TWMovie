import 'package:flutter/material.dart';
import 'package:twmovie_project/utils/text.dart';
import 'package:twmovie_project/utils/title.dart';


class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_Title(text:"Séries populares", size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: tv.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {},
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
                                          tv[index]['backdrop_path'],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Modified_Text(
                                  text: tv[index]['original_name'] != null
                                      ? tv[index]['original_name']
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
