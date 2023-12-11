import 'package:flutter/material.dart';

void main() => runApp(MyNotepad());

class MyNotepad extends StatelessWidget{
  @override

  Widget build(BuildContext contx){
    return MaterialApp(
      title: 'Meu Bloco de Notas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meu Bloco de Notas'),
        ),

        body: Center(
          child: Container(
            child: Text('Notas vazias'),
          ),
        ),
      ),
    );
  }
}