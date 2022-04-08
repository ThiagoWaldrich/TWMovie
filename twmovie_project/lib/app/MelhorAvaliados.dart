import 'package:flutter/material.dart';
import 'package:twmovie_project/utils/text.dart';

class MelhorAvaliados extends StatelessWidget {

  final List melhorAvaliados;

  const MelhorAvaliados({Key? key, required this.melhorAvaliados}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_Text(text:"Melhor avaliados",size:26),
          SizedBox(height:10,),
          Container(height:250,
          child: ListView.builder(itemCount: melhorAvaliados.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                
              },
              child:Container(
                width: 135,
                child: Column( 
                  children: [
                    Container( 
                      height: 185,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500'+melhorAvaliados[index]['poster_path']
                      ),
                      ),
                      ),
                    ),
                    Container(child:Modified_Text(text:melhorAvaliados[index]['title']!=null?
                    melhorAvaliados[index]['title']:'Carregando...'),)
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