import 'package:flutter/material.dart';
import 'package:twmovie_project/utils/subtitle.dart';
import 'package:twmovie_project/utils/text.dart';
import 'package:twmovie_project/utils/title.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Modified_Title(text: 'TWMovie', size: 30)),
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Modified_Subtitle(text: '⭐ Average Rating - ' + vote)),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child:
                  Modified_Text(text: name != null ? name : 'Error', size: 24)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
                  Modified_Text(text: 'Releasing On - ' + launch_on, size: 14)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Modified_Text(text: description, size: 18)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
