import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app/Components/todos.dart';
import 'Screens/Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) =>TodosProvider(),
    child: GetMaterialApp(
      title: 'Check- IT',
      debugShowCheckedModeBanner: false,
      home: DashBoard(),
    ),
  );
  }

