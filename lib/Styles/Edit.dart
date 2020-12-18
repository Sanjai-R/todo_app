import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app/Components/todoForm.dart';
import 'package:todo_flutter_app/Components/todos.dart';
import 'package:todo_flutter_app/Styles/todos.dart';

class EditToPage extends StatefulWidget {
  final Todo todo;
  const EditToPage({Key key, this.todo,
  }) : super(key: key);
  @override
  _EditToPageState createState() => _EditToPageState();
}

class _EditToPageState extends State<EditToPage> {
  String title;
  String description ,date ;
  final _formkey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<TodosProvider>(context, listen: false);
              provider.removeTodo(widget.todo);

              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: TextFormWidget(

            title: title,
            description: description,
            onChangeTitle: (title) => setState(() => this.title = title),
            onChangeDescription: (description) =>
                setState(() => this.description = description),
            onSavedTodo: saveTodo,
          ),
        ),
      ),
    );

  }
  void saveTodo() {
    final isValid = _formkey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title, description);

      Navigator.of(context).pop();
    }
  }
}
