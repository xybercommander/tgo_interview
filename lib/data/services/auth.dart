import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {

  //----- GOOGLE SIGN IN -----//
  Future<UserCredential?> signInWithGoogle() async {    
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final creds = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );

    return FirebaseAuth.instance.signInWithCredential(creds);
  } 

  //----- SIGN OUT -----//
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}