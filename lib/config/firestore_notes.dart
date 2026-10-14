import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreNotes {

  FirebaseFirestore connection = FirebaseFirestore.instance;
  CollectionReference? notesCollection;

  FireStoreNotes() {
    notesCollection = connection.collection('notes');
  }

  INSERT (Map<String, dynamic> note) async {
    notesCollection!.doc().set(note);
  }

  UPDATE (Map<String, dynamic> note, String id) async {
    notesCollection!.doc(id).update(note);
  }

  DELETE (String id) async {
    notesCollection!.doc(id).delete();
  }

  Stream<QuerySnapshot> SELECT () {
    return notesCollection!.snapshots();
  }

}