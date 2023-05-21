import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/login_pages.dart';

import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // logged user
          if (snapshot.hasData) {
            return HomePage();
          }
          // user not logged
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
