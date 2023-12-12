import 'package:flutter/material.dart';
import 'package:flutter_application_despesas/pages/home.dart';
import 'package:flutter_application_despesas/values/tema.dart';

void main() => runApp(MyNotepad());

class MyNotepad extends StatelessWidget{
  @override

  Widget build(BuildContext contx){
    return MaterialApp(
      theme: MyThema(contx),
      title: 'Meu Bloco de Notas',
      home: HomePage(),
    ); 
  }
}


/*
Scaffold(
        appBar: AppBar(
          title: Text('Meu Bloco de Notas'),
        ),

        body: Center(
          child: Container(
            child: Text('Notas vazias'),
          ),
        ),
      )
*/