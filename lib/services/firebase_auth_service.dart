import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dio/dio.dart';

class FirebaseAuthService {
  final Dio dio = Dio();

  Future signIn(
      String email,
      String password,
      ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }catch (e){
      print(e);
    }

  }

  Future signUp(
      String name,
      String email,
      String password,
      ) async {
    try{
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      print(user.user?.email);
    }
    on FirebaseAuthException catch(e){
      print("Code = ${e.code}");
      print("Message = ${e.message}");
    }catch(e){
      print(e);
    }
  }
  Future sendTokenToBackend(String token) async {
    try {
      final response = await dio.post("http://192.168.0.5:3000/auth/login",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          }
        )
      );
      print(response.data);
    }catch (e) {
      print(e);
    }
  }
}