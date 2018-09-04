import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Demo App',
    home: new MyApp(),
    color: Colors.redAccent,
  ));
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('MY demo App'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: new Text('hello', textDirection: TextDirection.ltr, style: TextStyle(color: Colors.redAccent),),
          )
        ],
      ),
    );
  }
}