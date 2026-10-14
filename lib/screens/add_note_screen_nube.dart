import 'package:dmsn/config/firestore_notes.dart';
import 'package:flutter/material.dart';

class AddNoteNubeScreen extends StatefulWidget {
  const AddNoteNubeScreen({super.key});

  @override
  State<AddNoteNubeScreen> createState() => _AddNoteNubeScreenState();
}

class _AddNoteNubeScreenState extends State<AddNoteNubeScreen> {
  FireStoreNotes? notesDB;
  final conTitle = TextEditingController();
  final conContent = TextEditingController();
  Map<String, dynamic>? note;

  @override
  void initState() {
    super.initState();
    notesDB = FireStoreNotes();
  }

  @override
  Widget build(BuildContext context) {

    if (ModalRoute.of(context)!.settings.arguments != null) {
      note = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      conTitle.text = note!['title']!;
      conContent.text = note!['content']!;
    }

    final txtTitle = TextFormField(controller: conTitle);
    final txtContent = TextFormField(maxLines: 8, controller: conContent);
    final space = SizedBox(height: 20);
    final btnSave = ElevatedButton(
      onPressed: () {
        if (note == null) {
          notesDB!
              .INSERT({
                "title": conTitle.text,
                "content": conContent.text,
                "fecha": "2026-09-25",
              })
              .then((value) {
                if (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Se guardo correctamente el registro"),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  Navigator.pop(context);
                }
              });
        } else {
          notesDB!.UPDATE({
            "title":conTitle.text,
            "content":conContent.text
          },note!['idNote']).then((value){
            if (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Se actualizo correctamente el registro"),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  Navigator.pop(context);
                }
          });
        }
      },
      child: Text("Save Note"),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Insertar Nota Nube")),
      body: Column(children: [txtTitle, space, txtContent, space, btnSave]),
    );
  }
}