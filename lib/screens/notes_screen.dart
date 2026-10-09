import 'package:flutter/material.dart';
import 'package:dmsn/database/notes_dao.dart';
import 'package:dmsn/database/notes_db.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  NotesDB? notesDB;

  //metodo para instanciar variables
  @override
  void initState() {
    super.initState();
    notesDB = NotesDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de notas")),
      body: FutureBuilder(
        future: notesDB!.SELECT(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ItemNote(snapshot.data![index]);
              },
            );
          } else {
            if (snapshot.hasError)
              return Center(child: Text(snapshot.error.toString()));
            else
              return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/add").then((value) {
          setState(() {});
        }),

        child: Icon(Icons.plus_one),
      ),
    );
  }
  //IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
  //IconButton(onPressed: (){}, icon: Icon(Icons.delete))

  Widget ItemNote(NotesDAO note) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Center(child: Text("10")),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.red,
              ),
            ),

            Column(children: [Text(note.title!), Text(note.content!)]),

            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/add", arguments: note).then((
                  value,
                ) {
                  setState(() {});
                });
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () async {
                return showDialog(
                  context: context,
                  builder: (context) => _buildAlertDialog(note.idNote!),
                );
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertDialog(int idNote) {
    return AlertDialog(
      title: Text('Alerta del sistema'),
      content: Text("¿Desea eliminar el registró :) ?"),
      actions: [
        TextButton(
          child: Text("Aceptar"),
          onPressed: () {
            notesDB!.DELETE(idNote).then((value) {
              String msj = (value == 1)
                  ? "Registro borrado"
                  : "Ha ocurrido un problema con el borrado";
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msj), duration: Duration(seconds: 3)),
              );
            });
            Navigator.of(context).pop();
            setState(() {});
          },
        ),

        TextButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}