import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Каттоо функциясы
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Sign Up Error: $e");
      return null;
    }
  }

  // Кирүү функциясы
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Sign In Error: $e");
      return null;
    }
  }

  // Колдонуучуну алуу
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Чыгуу функциясы
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
