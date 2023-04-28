import 'package:flutter/material.dart';

import 'LoginModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as LoginData;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF141e30),
                Color(0xFF243b55),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                args.email,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(args.password, style: Theme.of(context).textTheme.labelSmall)
            ],
          ),
        ),
      ),
    );
  }
}
