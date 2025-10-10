// lib/services/auth_service.dart

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // This is our direct line to Firebase's authentication services.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // SIGN UP a new user with email and password
  // This is like creating a new membership card.
  Future<User?> signUp(String email, String password) async {
    try {
      // Ask Firebase to create a new user with the provided email and password.
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      // If something goes wrong (like the email is already used), print an error.
      print('Error during sign up: ${e.toString()}');
      return null;
    }
  }

  // SIGN IN an existing user
  // This is like showing your membership card to the guard.
  Future<User?> signIn(String email, String password) async {
    try {
      // Ask Firebase to check if these login details are correct.
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      // If something is wrong (wrong password), print an error.
      print('Error during sign in: ${e.toString()}');
      return null;
    }
  }

  // SIGN OUT the current user
  // This is like ending your visit at the members' lounge.
  Future<void> signOut() async {
    await _auth.signOut();
  }
}