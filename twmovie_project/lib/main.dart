import 'package:flutter/material.dart';
import 'package:twmovie_project/home.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override  
  Widget build(BuildContext context){
    return MaterialApp(  
      home:Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurpleAccent),
    );
  }
}