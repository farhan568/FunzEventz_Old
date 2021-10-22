import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _googleSingIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async
  {
    googleAccount.value = await _googleSingIn.signIn();
    final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(
        googleAccount.value!.email);
    final googleAuth = await googleAccount.value!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseAuth.instance.signInWithCredential(credential).then((value){
      print("done");
    }).catchError((error){
      FirebaseAuthException e = error;
      print(e.message.toString());
    });
  }
}