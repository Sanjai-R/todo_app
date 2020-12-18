import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:todo_flutter_app/Components/textfield.dart';
import 'package:todo_flutter_app/Styles/Constants.dart';
class TextFormWidget extends StatefulWidget {
  final String title;
  final String description;
  final Color cColor;
  final ValueChanged<String> onChangeTitle;
  final ValueChanged<String> onChangeDescription;
  final VoidCallback onSavedTodo;
  const TextFormWidget(
      {Key key,
        this.title = '',
        this.description = '',
        this.cColor,
        @required this.onChangeDescription,
        @required this.onChangeTitle,
        @required this.onSavedTodo
      }): super(key: key);

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputBox(
            initialvalue: widget.title,
            labeltext: 'Title',
            onChange: widget.onChangeTitle,
            maxline: 1,
            validator: ValidationBuilder().minLength(5).maxLength(50).build(),
          ),
          InputBox(
            initialvalue: widget.description,
            labeltext: 'Description',
            onChange: widget.onChangeDescription,
            maxline: 3,
            validator: ValidationBuilder().minLength(5).maxLength(50).build(),
          ),
          SizedBox(height:20,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onSavedTodo,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Text('Save' ,style: titletext(fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),
    );
  }

  }

