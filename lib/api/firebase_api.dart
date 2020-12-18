// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_flutter_app/Styles/todos.dart';
//
//
//
// class FirebaseApi {
//   static Future<String> createTodo(Todo todo) async {
//     final docTodo = FirebaseFirestore.instance.collection('todo').doc();
//
//     todo.id = docTodo.id;
//     await docTodo.set(todo.toJson());
//   }
// }
