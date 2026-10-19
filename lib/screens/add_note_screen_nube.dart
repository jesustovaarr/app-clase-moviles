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
  final conDate = TextEditingController();
  DateTime _selectedDate = DateTime.now();
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
    conDate.text = _selectedDate.toString();

    final txtTitle = TextFormField(
      controller: conTitle,
      decoration: InputDecoration(hintText: "Title"),
    );
    final txtContent = TextFormField(
      maxLines: 8,
      controller: conContent,
      decoration: InputDecoration(hintText: "Content"),
    );
    final txtDate = TextFormField(
      controller: conDate,
      decoration: InputDecoration(hintText: "Fecha de vencimiento"),
      onTap: () => _desplegarFechas(context),
    );
    final space = SizedBox(height: 20);
    final btnSave = ElevatedButton(
      onPressed: () {
        if (note == null) {
          notesDB!
              .INSERT({
                "title": conTitle.text,
                "content": conContent.text,
                "fecha": conDate.text,
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
            "content":conContent.text,
            "fecha":conDate.text,
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
      body: Column(children: [txtTitle, space, txtContent,space, txtDate, space, btnSave]),
    );
  }

  _desplegarFechas(BuildContext context) async{
    final DateTime? _date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100)
    );

    if (_date != null && _date != _selectedDate) {
      setState(() {
        _selectedDate = _date;
      });
    }

  }

}