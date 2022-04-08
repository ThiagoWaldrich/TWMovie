import 'package:flutter/material.dart';
import 'package:twmovie_project/utils/text.dart';

class TrendingMovies extends StatelessWidget {

  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_Text(text:"Top Filmes",size:26),
          SizedBox(height:5,),
          Container(height:270,
          child: ListView.builder(itemCount: trending.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                
              },
              child:Container(
                width: 140,
                child: Column( 
                  children: [
                    Container( 
                      height: 200,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                      ),
                      ),
                      ),
                    ),
                    Container(child:Modified_Text(text:trending[index]['title']!=null?
                    trending[index]['title']:'Carregando...'),)
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