import 'package:firebase_auth/firebase_auth.dart';
import 'package:teamgdsc/helper/helper_function.dart';
import 'package:teamgdsc/service/datavase_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login
  Future loginWithEmailAndPassword(String email, String password) async {

    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user!;


      if(user != null){
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  }

  //register
  Future regiserUserWithEmailAndPassword(String email, String password) async {

    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;


      if(user != null){
        //call our datgabase to update the userdata
        await DatabaseService(uid: user.uid).savingUserData(email);

        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  }

  //signout
  Future signOut() async {
    try{
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await firebaseAuth.signOut();
    }catch (e) {
      return null;
    }
  }
}