import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const kAppBarTitle = Text('IP API');

const kAppBarTheme = AppBarTheme(
  color: Color(0xFFFFBB47),
  centerTitle: true,
  titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
);

//Style for the TextFormField from ip_api_screen
const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none),
  hintText: "Enter your IP address",
  hintStyle: TextStyle(color: Colors.grey),
  errorStyle: TextStyle(fontSize: 20),
  helperText: "Use only: 'Aa-Ff', '0-9', ' . ', ' : '",
  helperStyle: TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 2),
);
//Decoration for the Container widget from the ResultPage class (the result_page)
const kResultBoxDecoration = BoxDecoration(
  color: Color(0xFF4E426F),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

//TextFromField text style
const kTextFromFieldTextStyle = TextStyle(color: Colors.black);

//Text style: Label and Field for result_page
const kTextFieldLabelStyle = TextStyle(
  fontSize: 30,
  color: Colors.white,
);
const kTextFieldStyle = TextStyle(
    fontSize: 22, color: Colors.white, overflow: TextOverflow.ellipsis);

//ErrorAlert style

const kAlertStyle = AlertStyle(
  backgroundColor: Colors.white,
  descStyle: TextStyle(fontSize: 20, color: Colors.black),
  titleStyle:
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
  titleTextAlign: TextAlign.center,
  animationType: AnimationType.grow,
);
