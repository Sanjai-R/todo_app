import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Screens/HomePage.dart';
import 'package:todo_flutter_app/Styles/Constants.dart';

class Header extends StatelessWidget {
  final String title;
  final Icon icon;
  Header({
    this.title,
    this.icon,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title ,style: titletext(),)),
        leading: IconButton(
          icon: icon,
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},

        ),

      ),

    );
  }
}
