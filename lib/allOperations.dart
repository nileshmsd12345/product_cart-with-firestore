import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AllOperation extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _signIn = GoogleSignIn();

  signinWithGoogle() async {
    final GoogleSignInAccount googleUser = (await _signIn.signIn())!;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final User? user =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    notifyListeners();
  }
}
