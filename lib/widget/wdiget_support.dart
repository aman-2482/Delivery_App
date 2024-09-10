import 'dart:ui';

import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }
  static TextStyle HeadlineTextFIeldStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 29,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }
  static TextStyle HeaderTextFIeldStyle(){
    return TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins");
  }
  static TextStyle SemiTextFIeldStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }
}