import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser ({required String email, required String password}) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      credentials.user?.sendEmailVerification();
    } catch (e) {
      print('Error creating user: $e');
      return false;
    }
    return true;
  }

  Future<bool> loginUser ({required String email, required String password}) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (credentials.user!.emailVerified) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

}