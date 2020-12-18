import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app/Components/todos.dart';
import 'package:todo_flutter_app/Components/todowidget.dart';
import 'package:todo_flutter_app/Styles/Constants.dart';
class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos ;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text('Work list', style: titletext(color: Color(0xff1db954),fontWeight: FontWeight.w700))),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          itemBuilder: (context ,index){
          final todo = todos[index];
          return TodoWidget(todo: todo,);
        }, itemCount: todos.length, separatorBuilder: (BuildContext context, int index) =>
            Container(height: 30,
            ),

        ),
      ),

    );
  }

}
