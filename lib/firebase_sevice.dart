import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService{
  Future<void> signUp({required String email,required String password}) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);

    }catch(e){
      print('error');
    }
  }
}