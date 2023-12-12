
import 'package:flutter/material.dart';
import 'package:flutter_application_despesas/values/tema.dart';

class models extends StatefulWidget {
  
  @override
  State<models> createState() => _modelsState();
}

class _modelsState extends State<models> {
  
  final _tituloController = new TextEditingController();
  final _conteudoController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      height: 1920,
      color: green2,
      child:  Form( 
        child:SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(controller: _tituloController, decoration: const InputDecoration(labelText: 'Titulo'),),
            TextFormField(controller: _conteudoController, decoration: const InputDecoration(labelText: 'Conteudo'), maxLines: 10,),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: (){
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
    );
  }

  @override
  void dispose(){
    this._conteudoController.dispose();
    this._tituloController.dispose();
    super.dispose();
  }
}