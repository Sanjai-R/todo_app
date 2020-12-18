import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app/Components/todoForm.dart';
import 'package:todo_flutter_app/Components/todos.dart';
import 'package:todo_flutter_app/Screens/CompleteTodo.dart';
import 'package:todo_flutter_app/Screens/todolist.dart';
import 'package:todo_flutter_app/Styles/Constants.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_app/Styles/todos.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String date = '';
  Color cColor = Colors.white;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedTodo()
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[900],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color(0xff1db954),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            currentIndex: selectIndex,
            items: [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.thList),
                label: 'Todos',
              ),
              BottomNavigationBarItem(
               icon: FaIcon(FontAwesomeIcons.clipboardCheck),
                label: 'Completed',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectIndex = index;
              });
            },
          ),
          body: tabs[selectIndex],
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Color(0xff1db954),
            onPressed: addTask,
            child: Icon(Icons.add ,color: Colors.black,size: 40,),
          ),
        ));
  }

  void addTask() async {
    return Get.defaultDialog(
        title: 'Add Notes', titleStyle: GoogleFonts.ebGaramond(
        fontSize: 20,
        fontWeight: FontWeight.bold
    ),
        backgroundColor: Colors.white,
        content: SingleChildScrollView(

          child: Column(
            children: [
              Form(
                key: _formkey,
                child: TextFormWidget(
                  onChangeTitle: (title) => setState(() => this.title = title),
                  onChangeDescription: (description) =>
                      setState(() => this.description = description),
                  onSavedTodo: addTodo,
                ),
              ),
              SizedBox(height: 12,),
            ],
          ),

        )
    );
  }
  void addTodo() {
    final isValid = _formkey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        createdTime: DateTime.now(),
        title: title,
        description: description,
      );
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
