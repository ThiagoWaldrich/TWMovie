import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      theme: ThemeData(  
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(  
        child:Text("Fonte",style:TextStyle(  
          fontSize: 50,
          fontFamily: "Rubik",
        ))
      )
      
    );
  }
}