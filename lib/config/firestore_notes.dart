import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreNotes {

  FirebaseFirestore connection = FirebaseFirestore.instance;
  CollectionReference? notesCollection;

  FireStoreNotes() {
    notesCollection = connection.collection('notes');
  }

  Future<bool> INSERT (Map<String, dynamic> note) async {
    try {
      notesCollection!.doc().set(note);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> UPDATE (Map<String, dynamic> note, String id) async {
    try {
    notesCollection!.doc(id).update(note);
    return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> DELETE (String id) async {
    try {
      notesCollection!.doc(id).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<QuerySnapshot> SELECT () {
    return notesCollection!.snapshots();
  }

}