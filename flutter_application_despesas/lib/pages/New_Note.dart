
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_despesas/models/Note_models.dart';
import 'package:flutter_application_despesas/values/tema.dart';
import 'package:shared_preferences/shared_preferences.dart';

class models extends StatefulWidget {
  
  @override
  State<models> createState() => New_Note();
}

class New_Note extends State<models> {
  
  final _tituloController = new TextEditingController();
  final _conteudoController = new TextEditingController();
  final _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        height: 1920,
        color: green2,
        child:  Form( 
          key: _formularioKey,
          child:SingleChildScrollView(
          child: Column(
            children: [

              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Titulo'),

                validator: (String? _titulo){
                  if(_titulo!.isEmpty){
                    return 'Campo obrigatorio';
                  }
                },
                ),

              TextFormField(
                controller: _conteudoController,
                decoration: const InputDecoration(labelText: 'Conteudo'),

                validator: (String? _conteudo){
                  if(_conteudo!.isEmpty){
                    return 'Campo obrigatorio';
                  }
                },
                maxLines: 10,),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      if(_formularioKey.currentState!.validate()){
                        _SaveNote(){

                        }
                      }
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar((
                        const SnackBar(
                          content: Text('Nota salva com sucesso'),
                        )),
                      );
                    },
                    child: Text('Salvar')
                  ),

                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar((
                          const SnackBar(
                            content: Text('Operacao cancelada'),
                          )),
                      );
                    }, 
                    child: Text('Cancelar')),
                    const SizedBox(width: 5),  
                ],
              ),
            ],
          ),
          ),
      )
    ),
    );
  }

  @override
  void dispose(){
    this._conteudoController.dispose();
    this._tituloController.dispose();
    super.dispose();
  }

  void _SaveNote(){
    Notes_Models new_note = Notes_Models(
      titulo: _tituloController.text,
      conteudo: _conteudoController.text
    );
    _SaveInUser(new_note);

  }

  void _SaveInUser(Notes_Models New_note) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      "SAVE_NOTE_LOCAL",
      json.encode(New_note.toJson()),
    );
  }
}