import 'package:flutter/material.dart';


void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blocos de Notas',
      home: NoteList(),
    );
  }
}

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  Map<String,String> notes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocos de Notas'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          String titulo = notes.keys.elementAt(index);
          String conteudo = notes.values.elementAt(index);

          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo),
                Text(conteudo),
              ],
            ),
            onTap: () {
              _editNote(index);
            },
            onLongPress: () {
              _deleteNote(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNote() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController _titulo = TextEditingController();
      TextEditingController _conteudo = TextEditingController();
      return AlertDialog(
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          color: const Color.fromARGB(255, 44, 105, 46),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _titulo,
                  decoration: const InputDecoration(labelText: 'Titulo'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _conteudo,
                  decoration: const InputDecoration(labelText: 'Conteudo'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  maxLines: 10,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (_titulo.text.isNotEmpty && _conteudo.text.isNotEmpty) {
                setState(() {
                  notes[_titulo.text] = _titulo.text;
                  notes[_conteudo.text] = _conteudo.text;
                });
                Navigator.of(context).pop();
              }
            },
            child: Text('Adicionar'),
          ),
        ],
      );
    },
  );
}


  void _editNote(int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String tituloAtual = notes.keys.elementAt(index);
      String conteudoAtual = notes.values.elementAt(index);

      TextEditingController _titulo = TextEditingController(text: tituloAtual);
      TextEditingController _conteudo = TextEditingController(text: conteudoAtual);

      return AlertDialog(
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          color: Color.fromARGB(255, 71, 90, 143),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _titulo,
                  decoration: const InputDecoration(labelText: 'Titulo'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _conteudo,
                  decoration: const InputDecoration(labelText: 'Conteudo'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  maxLines: 10,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                notes.remove(tituloAtual);
                notes[_titulo.text] = _conteudo.text;
              });
              Navigator.of(context).pop();
            },
            child: Text('Salvar'),
          ),
        ],
      );
    },
  );
}


  void _deleteNote(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Excluir Nota'),
          content: Text('Tem certeza de que deseja excluir esta nota?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  notes.remove(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}