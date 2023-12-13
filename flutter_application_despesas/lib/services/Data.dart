import 'package:flutter_application_despesas/models/Note_models.dart';

class DataUser{
  Future<List<Notes_Models>> getNotas() async{

    List<Notes_Models> MyNotes = [
      Notes_Models(titulo: 'Teste 1', conteudo: 'Ta sendo testado 01'),
      Notes_Models(titulo: 'Teste 2', conteudo: 'Ta sendo testado 02'),
      Notes_Models(titulo: 'Teste 3', conteudo: 'Ta sendo testado 03'),
      Notes_Models(titulo: 'Teste 4', conteudo: 'Ta sendo testado 04'),
      Notes_Models(titulo: 'Teste 5', conteudo: 'Ta sendo testado 05'),
  ];
    return MyNotes;
  }

  saveNotas(String _titulo, String _conteudo){
     
  }
}