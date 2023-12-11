
import 'package:flutter/material.dart';

const Color green1 = Color(0xffDAD7CD);
const Color green2 = Color(0xffA3B18A);
const Color green3 = Color(0xff588157);
const Color green4 = Color(0xff3A5A40);
const Color green5 = Color(0xff344E41);

ThemeData MyThema (BuildContext contx){
  return ThemeData(
    primaryColor: green3,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ).copyWith(
      secondary: Colors.greenAccent,
    ),
  );
}