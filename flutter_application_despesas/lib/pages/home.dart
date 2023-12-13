import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_despesas/models/Note_models.dart';
import 'package:flutter_application_despesas/values/tema.dart';

class HomePage extends StatelessWidget{

  List<Notes_Models> MyNotes = [
      Notes_Models(titulo: 'Teste 1', conteudo: 'Ta sendo testado 01'),
      Notes_Models(titulo: 'Teste 2', conteudo: 'Ta sendo testado 02'),
      Notes_Models(titulo: 'Teste 3', conteudo: 'Ta sendo testado 03'),
      Notes_Models(titulo: 'Teste 4', conteudo: 'Ta sendo testado 04'),
      Notes_Models(titulo: 'Teste 5', conteudo: 'Ta sendo testado 05'),
      Notes_Models(titulo: 'Teste 6', conteudo: 'Ta sendo testado 06'),
  ];
  
  @override
  Widget build (BuildContext contx){
    return Scaffold(
      appBar: AppBar(title: Text('MyNotes App')),
      floatingActionButton: FloatingActionButton(
        onPressed:()  {
          Navigator.pushNamed(contx, 'New_Note');
        },

        child: Icon(Icons.add),
      ),

      body: ListView(
        children: [
          for(Notes_Models notes in MyNotes)
          ListTile(
            title: Text(notes.titulo!),
            subtitle: Text(notes.conteudo!),

          )
        ],
      )
    );
  }
}