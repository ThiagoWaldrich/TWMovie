import 'package:flutter/material.dart';
import 'package:twmovie_project/utils/text.dart';
import 'package:twmovie_project/utils/title.dart';
import 'package:twmovie_project/information.dart';

class BestRated extends StatelessWidget {

  final List bests;

  const BestRated({Key? key, required this.bests}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child:Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_Title(text:"Filmes melhor avaliados",size:26,),
          SizedBox(height:5,),
          Container(height:250,
          child: ListView.builder(itemCount: bests.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: bests[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      bests[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      bests[index]['poster_path'],
                                  description: bests[index]['overview'],
                                  vote:bests[index]['vote_average'].toString(),
                                  launch_on:bests[index]['release_date']
                                )));
              },
              child:Container(
                width: 135,
                child: Column( 
                  children: [
                    Container( 
                      height: 185,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500'+bests[index]['poster_path']
                      ),
                      ),
                      ),
                    ),
                    Container(child:Modified_Text(
                      text:bests[index]['title']!=null?
                    bests[index]['title']:'Carregando...'),)
                  ],
                )
              )
            );
          },
          ),
        ),
        ],
      ),
    );
  }
}