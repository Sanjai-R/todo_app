import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Styles/Constants.dart';
Column dashboardPage(context,String img, String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 10),
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
            image:
            DecorationImage(image: AssetImage('Asset/images/$img.png'))),
      ),
      SizedBox(height: 30),
      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: normaltext(fsize: 30.0, color: Color(0xff1db954)),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text",
          style: normaltext(fsize: 20.0, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}
