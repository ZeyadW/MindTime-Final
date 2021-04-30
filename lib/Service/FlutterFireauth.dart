import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  print("sign inn abl tryyyyyyy ");
  print(email);
  print(password);
  try {
    print("gwa try sign in");
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print(FirebaseAuth.instance.currentUser.uid);
    print("b3d await");
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    print("fire Emaillll email" + email);
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print("fire Emaillll email" + email);

    print("fire auth");
    print(FirebaseAuth.instance.currentUser.uid);
    return true;
  } on FirebaseAuthException catch (e) {
    print("fire eerr");
    print(e);
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print("fire auth   catch");
    print(e.toString());
    return false;
  }
}
