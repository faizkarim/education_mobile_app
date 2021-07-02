import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GetStorage storage = GetStorage();

  Future<User> login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      storage.write('uid', userCredential.user.uid);
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  Future<User> register(
    String email,
    String password,
    String displayName,
    String phoneNumber,
  ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential != null) {
        userCredential.user.updateProfile(
          displayName: displayName,
        );
      }
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.message.contains("email")) {
        return null;
      } else {
        return null;
      }
    }
  }

  Future<void> logout() async {
    storage.erase();
    await auth.signOut();
  }
}
