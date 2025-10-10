// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petpedia/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true; // To switch between Login and Signup

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetPedia Auth', style: GoogleFonts.poppins()),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isLogin ? 'Welcome Back!' : 'Create Account',
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  // Create an instance of our AuthService to use its functions.
                  final authService = AuthService();

                  // Get the text the user typed into the email and password fields.
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();

                  User? user;
                  if (_isLogin) {
                    // If the user is trying to log in, call the signIn function.
                    print('Attempting to sign in...');
                    user = await authService.signIn(email, password);
                  } else {
                    // If the user is trying to sign up, call the signUp function.
                    print('Attempting to sign up...');
                    user = await authService.signUp(email, password);
                  }

                  // Check if the login/signup was successful.
                  if (user != null) {
                    print('Success! User ID: ${user.uid}');
                    // After success, you will automatically be taken to the home screen.
                    // We will set this up next.
                  } else {
                    print('Operation failed. Please check your credentials or the console for errors.');
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: Text(_isLogin ? 'Login' : 'Sign Up'),
),
                
                
                print('Email: ${_emailController.text}');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: Text(_isLogin ? 'Login' : 'Sign Up'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = !_isLogin;
                });
              },
              child: Text(_isLogin ? 'Need an account? Sign Up' : 'Have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}