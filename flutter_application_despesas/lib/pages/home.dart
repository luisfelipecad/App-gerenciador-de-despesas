import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_despesas/models/notas.dart';
import 'package:flutter_application_despesas/values/tema.dart';

class HomePage extends StatelessWidget{
  
  List<Nota> MyNotes = [
    Nota(titulo: 'Teste 1', conteudo: 'Ta sendo testado 01'),
    Nota(titulo: 'Teste 2', conteudo: 'Ta sendo testado 02'),
    Nota(titulo: 'Teste 3', conteudo: 'Ta sendo testado 03'),
    Nota(titulo: 'Teste 4', conteudo: 'Ta sendo testado 04'),
    Nota(titulo: 'Teste 5', conteudo: 'Ta sendo testado 05'),
  ];

  @override
  Widget build (BuildContext contx){
    return Scaffold(
      appBar: AppBar(title: Text('MyNotes App')),
      
      floatingActionButton: FloatingActionButton(
        onPressed:()  {
          Navigator.push(contx, 'criar_notas' as Route<Object?>);
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