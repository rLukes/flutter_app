import 'package:flutter/material.dart';
import 'package:flutter_app/model/book.dart';
import 'package:flutter_app/util/dbhelper.dart';
import 'package:flutter_app/ui/book.dart';

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return new BookList();
  }
}