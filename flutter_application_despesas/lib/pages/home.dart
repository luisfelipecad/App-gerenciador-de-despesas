import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_despesas/models/notas.dart';
import 'package:flutter_application_despesas/values/tema.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build (BuildContext contx){
    return Scaffold(
      appBar: AppBar(title: Text('MyNotes App')),
      floatingActionButton: FloatingActionButton(
        onPressed:()  {
          Navigator.pushNamed(contx, 'criar_notas');
        },

        child: Icon(Icons.add),
      ),

      body: ListView(
        children: [
          for(Nota nota in MyNotes)
          ListTile(
            title: Text(nota.titulo!),
            subtitle: Text(nota.conteudo!),

          )
        ],
      )
    );
  }
}