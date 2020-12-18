import 'package:flutter/cupertino.dart';
import 'package:todo_flutter_app/utils.dart';

class TodoField {
  static const createdTime = 'creadtedTime' ;
}

class Todo {
  DateTime createdTime;
  String title,id,description,date;
  bool isDone;
  Todo ({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.date = '',
    this.id ,
    this.isDone = false
});
  //
}