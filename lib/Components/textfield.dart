import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputBox extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final int maxline;
  final double height, width;
  final String hintText, labeltext, initialvalue;
  final Color boxColor, cursorColor;
  final TextStyle hintStyle;
  final TextInputType textInputType;
  final FaIcon icon;
  final Widget suffixIcon;
  final bool obscure;
  final TextEditingController controller;
  final ValueChanged<String> onChange;
  final void Function(String value) validator;
  final GestureTapCallback onTap;
  InputBox(
      {Key key,
      this.formkey,
      this.height,
      this.width,
      this.initialvalue,
      this.hintText,
      this.boxColor,
      this.hintStyle,
      this.labeltext,
      this.icon,
      this.onTap,
      this.obscure = false,
      this.controller,
      this.cursorColor,
      this.suffixIcon,
      this.textInputType,
      this.validator,
      this.onChange,
      this.maxline})
      : super(key: key);
  void validate() {
    formkey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: initialvalue,
        maxLines: maxline,
        onChanged: onChange,
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        cursorColor: cursorColor,
        onTap: onTap,
        style:
            GoogleFonts.ebGaramond(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: labeltext,
          icon: icon,
          suffixIcon: suffixIcon,
          hoverColor: Colors.white,
          hintText: hintText,
          hintStyle: hintStyle,
        ),
        validator: validator);
  }
}
