import 'package:flutter/material.dart';
import 'package:login_signup/home.dart';
import 'package:login_signup/signup.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.white54),
            labelSmall:
                TextStyle(fontSize: 15, height: 1, color: Colors.white54)),
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'signup': (context) => const SignupPage(),
        'home': (context) => const HomePage(),
      },
    );
  }
}
