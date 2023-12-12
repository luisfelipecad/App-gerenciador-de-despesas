
import 'package:flutter/material.dart';
import 'package:flutter_application_despesas/values/tema.dart';

class models extends StatefulWidget {
  
  @override
  State<models> createState() => _modelsState();
}

class _modelsState extends State<models> {
  
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
                        User 
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
}