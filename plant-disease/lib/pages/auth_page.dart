import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:modernlogintute/pages/login_page.dart';
import 'home_page.dart';
import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ignore: prefer_const_constructors
            return Dashboard();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
