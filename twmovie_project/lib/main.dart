import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

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
  List topMovies = [];
  List melhorAvaliados = [];
  List tv = [];
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
    Map topMoviesresult = await  tmdbWithCustomLogs.v3.trending.getTrending();
    Map melhorAvaliadosresult = await  tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await  tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      topMovies = topMoviesresult['results'];
      melhorAvaliados = melhorAvaliadosresult['results'];
      tv = tvresult['results'];
    });
    print(topMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TWMovie', style: TextStyle(
        fontFamily:'Rubik',
      )),),
    );
  }
}