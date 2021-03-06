import 'package:firebase_auth/firebase_auth.dart';

Future<String> signIn(String email, String password) async {
  print("sign inn abl tryyyyyyy ");
  print(email);
  print(password);
  try {
    print("gwa try sign in");
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print(FirebaseAuth.instance.currentUser.uid);
    print("b3d await");
    return "Logged in successfully";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return "No user found for that email.";
    } else if (e.code == 'wrong-password') {
      return "Wrong password provided for that user.";
    }
    return "No Internet Connection";
  } catch (e) {
    return e.toString();
  }
}

Future<String> register(String email, String password) async {
  try {
    print("fire Emaillll email" + email);
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print("fire Emaillll email" + email);

    print("fire auth");
    print(FirebaseAuth.instance.currentUser.uid);
    return "Account Created Successfully";
  } on FirebaseAuthException catch (e) {
    print("fire eerr");
    print(e);
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
    }
    return "No Internet Connection";
  } catch (e) {
    print("fire auth   catch");
    print(e.toString());
    return e.toString();
  }
}
