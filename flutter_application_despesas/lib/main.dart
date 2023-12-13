import 'package:flutter/material.dart';


void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blocos de Notas',
      home: _LoginNotas(),
    );
  }
}

class _LoginNotas extends StatefulWidget {
  @override
  _LoginNotasState createState() => _LoginNotasState();
}

class _LoginNotasState extends State<_LoginNotas> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocos de Notas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Lógica de autenticação fictícia (substitua por sua própria lógica)
                String username = _usernameController.text;
                String password = _passwordController.text;

                if (username == 'usuarioteste' && password == 'senhateste') {
                  // Autenticação bem-sucedida, navega para a tela de blocos de notas
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => NoteList()),
                  );
                } else {
                  // Exibe uma mensagem de erro (substitua por sua própria lógica)
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erro de Autenticação'),
                        content: Text('Credenciais inválidas. Tente novamente.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
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
          String _titulo = notes.keys.elementAt(index);
          String _conteudo = notes.values.elementAt(index);
          return ListTile(
            title: Text(_titulo),
            subtitle: Text(_conteudo),
            
            trailing: 
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Color.fromARGB(255, 255, 0, 0),
                  onPressed: () {
                    _editNote(_titulo, _conteudo);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Color.fromARGB(255, 255, 0, 0),
                  onPressed: () {
                    _deleteNote(_titulo,_conteudo);
                  },
                ),
              ],
            ),
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
          color: Color.fromRGBO(181, 248, 184, 1),
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
                  notes[_titulo.text] = _conteudo.text;
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



  void _editNote(String titulo, String conteudo) {
  showDialog(
    context: context,
    builder: (BuildContext context) {

      TextEditingController _titulo = TextEditingController(text: titulo);
      TextEditingController _conteudo = TextEditingController(text: conteudo);

      return AlertDialog(
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          color: Color.fromRGBO(181, 248, 184, 1),
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
                notes.remove(_titulo);
                notes.remove(_conteudo);
                notes[_titulo.text] = _conteudo.text;
                notes[_conteudo.text] = _conteudo.text;
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


  void _deleteNote(String titulo, String conteudo) {
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
                  notes.remove(titulo);
                  notes.remove(conteudo);
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