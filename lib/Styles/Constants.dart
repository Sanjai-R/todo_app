import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle normaltext({double fsize=30 ,Color color = Colors.white , TextStyle font}){
  var text = GoogleFonts.lora(
    fontWeight: FontWeight.w600,
    fontSize: fsize,
    color: color,


  );
  return text;
}
TextStyle titletext({double fsize=30 ,Color color = Colors.white , FontWeight fontWeight}){
  var text = GoogleFonts.ebGaramond(
    fontWeight: fontWeight,
    fontSize: fsize,
    color: color,


  );
  return text;
}