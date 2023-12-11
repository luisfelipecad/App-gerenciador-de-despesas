
import 'package:flutter/material.dart';
import 'package:flutter_application_despesas/values/tema.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext contx){
    return Scaffold(
      appBar: AppBar(title: Text('Nota App')),
      
      floatingActionButton: FloatingActionButton(
        onPressed:()  {
          showModalBottomSheet(
            context: contx,
            builder: (BuildContext contx){

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                height: 350,
                color: green2,
                child:  Form(
                  child: Column(
                    children: [
                      TextFormField(decoration: InputDecoration(labelText: 'Titulo'),),
                      TextFormField(decoration: InputDecoration(labelText: 'Conteudo'),),
                      Row
                      (children: [
                          ElevatedButton(onPressed: (){Navigator.pop(contx);}, child: Text('Salvar')),
                          ElevatedButton(onPressed: (){Navigator.pop(contx);}, child: Text('Cancelar'))  
                        ],
                      ),
                    ],
                  ),
                )
              );

            });
        },
        child: Icon(Icons.add),
      ),

      body: Center(
        child: Container(
          child: Text('Ola'),
        ),
      ),
    );
  }
}