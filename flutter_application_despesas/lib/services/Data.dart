import 'package:flutter_application_despesas/models/notas.dart';

class DataUser{
  Future<List<Nota>> getNotas() async{

    List<Nota> MyNotes = [
      Nota(titulo: 'Teste 1', conteudo: 'Ta sendo testado 01'),
      Nota(titulo: 'Teste 2', conteudo: 'Ta sendo testado 02'),
      Nota(titulo: 'Teste 3', conteudo: 'Ta sendo testado 03'),
      Nota(titulo: 'Teste 4', conteudo: 'Ta sendo testado 04'),
      Nota(titulo: 'Teste 5', conteudo: 'Ta sendo testado 05'),
  ];
    return MyNotes;
  }

  saveNotas(String titulo, String conteudo){
    
  }
}