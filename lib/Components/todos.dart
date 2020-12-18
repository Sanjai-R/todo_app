import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Styles/todos.dart';
class TodosProvider extends ChangeNotifier{
  List<Todo> _todos = [
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted => _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.description = description;
    todo.title = title;

    notifyListeners();
  }
}