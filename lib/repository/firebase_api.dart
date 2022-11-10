import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {

  Future<String?> registerUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Firebase API: USUARIO CREADO EXITOSAMENTE!!! =====>");
      return credential.user?.uid;
    }
    on FirebaseAuthException catch (e) {
      print(
          'Firebase API: FirebaseAuthException ERROR CREANDO USUARIO!!! =====>: ${e
              .code}');
      return e.code;
    }
    on FirebaseException catch (e) {
      print(
          'Firebase API: FirebaseException ERROR CREANDO USUARIO!!! =====>: ${e
              .code}');
      return e.code;
    }
  }

  Future<String?> logInUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Firebase API: USUARIO CONSULTADO DE LA BASE DE DATOS EXITOSAMENTE!!! =====>");
      return credential.user?.uid;
    }
    on FirebaseAuthException catch (e) {
      print(
          'Firebase API: FirebaseAuthException ERROR CREANDO USUARIO!!! =====>: ${e
              .code}');
      return e.code;
    }
    on FirebaseException catch (e) {
      print(
          'Firebase API: FirebaseException ERROR CREANDO USUARIO!!! =====>: ${e
              .code}');
      return e.code;
    }
  }
}