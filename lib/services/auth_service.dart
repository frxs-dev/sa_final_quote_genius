import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Pegar usuário atual
  User? get currentUser => _auth.currentUser;

  // Stream para monitorar estado de login em tempo real
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Método de Login
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow; // Repassa o erro para a tela tratar e exibir ao usuário
    }
  }

  // Método de Cadastro
  Future<UserCredential?> signUp(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Método de Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}