import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:twmovie_project/app/best_rated.dart';
import 'package:twmovie_project/app/tv.dart';
import 'package:twmovie_project/utils/text.dart';
import 'package:twmovie_project/utils/title.dart';

import 'app/releases.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override  
  Widget build(BuildContext context){
    return MaterialApp(  
      home:Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() =>_HomeState();
}

class _HomeState extends State<Home> {
  List most_popular = [];
  List top_rated = [];
  List top_movies = [];
  final String apikey = '9bbb9b92261517b932c8896fe1266c79';
  final readAccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YmJiOWI5MjI2MTUxN2I5MzJjODg5NmZlMTI2NmM3OSIsInN1YiI6IjYyNGUwN2Q2NTQ1MDhkMDA5YzdkYmIwMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mqWJ-fPJCpRvYe4QM1vTxJ-_prAmCTYSXg2VNu739HE';

  @override 
  void initState(){
    loadMovies();
    super.initState();
  }
  
  loadMovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccesstoken),
    logConfig: ConfigLogger(showErrorLogs: true, showLogs: true)
    );
    Map most_popular_result = await  tmdbWithCustomLogs.v3.movies.getPouplar();
    Map top_rated_result = await  tmdbWithCustomLogs.v3.movies.getTopRated();
    Map top_movies_result = await  tmdbWithCustomLogs.v3.movies.getUpcoming();

    setState(() {
      most_popular = most_popular_result['results'];
      top_rated = top_rated_result['results'];
      top_movies = top_movies_result['results'];
    });
    print(top_movies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepPurple ,
      appBar: AppBar(backgroundColor: Colors.transparent,
        title: Modified_Title(text:'TWMovie', size: 30)),
        body:ListView(  
          children: [
            TV(tv:most_popular),
            BestRated(bests: top_rated),
            Releases(releases:top_movies),
          ],
        )
      );
  }
}