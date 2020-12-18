import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app/Components/todos.dart';
import 'package:todo_flutter_app/Styles/Constants.dart';
import 'package:todo_flutter_app/Styles/Edit.dart';
import 'package:todo_flutter_app/Styles/todos.dart';

import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context)  => ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Slidable(
    key: Key(todo.id),
    actionPane: SlidableDrawerActionPane(),
    actions: [
      IconSlideAction(
        color: Colors.green,
        onTap: () => editTodo(context ,todo),
        caption: "Edit",
        icon: Icons.edit,
      )
    ],
    secondaryActions: [
      IconSlideAction(
        color: Colors.red,
        onTap: () => deleTodo(context , todo),
        caption: "Delete",
        icon: Icons.delete,
      )
    ],
    child: buildTodo(context),
    ),
  );
  Widget buildTodo(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.green,
            checkColor: Colors.white,
            value: todo.isDone,
            onChanged: (_){
              final provider = Provider.of<TodosProvider>(context , listen: false);
              final isDone = provider.toggleTodoStatus(todo);
              Utils.showSnackBar(context,
                isDone? 'Task completed' : 'Task Marked InCompleted'
              );
            },
          ),
          SizedBox(width: 20,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: titletext(color: Color(0xff1db954),fontWeight: FontWeight.bold),
              ),
              if(todo.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text('${todo.description}',
                    style: titletext(fsize: 28 ,color: Colors.white),
                  ),
                ),

            ],
          )),
          if(todo.date.isNotEmpty)
            Container(
              child: Text('${todo.date}',
                style: titletext(fsize: 28 ,color: Colors.white),
              ),
            )
        ],
      ),
    );
  }
  void deleTodo(BuildContext context ,Todo todo){
    final provider = Provider.of<TodosProvider>(context , listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context , 'Deleted the Task');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditToPage(todo: todo)));
  }

}
